use Amnesia

defdatabase DB do
    
  deftable Tbl, [:id,:name], type: :ordered_set do
  
  end

    #deftable User

  # this defines a table with an user_id key and a content attribute, and
  # makes the table a bag; tables are basically records with a bunch of helpers
  deftable Message, [:user_id, :content], type: :bag do
    # this isn't required, but it's always nice to spec things
    @type t :: %Message{user_id: integer, content: String.t}

    # this defines a helper function to fetch the user from a Message record
    def user(self) do
      User.read(self.user_id)
    end

    # this does the same, but uses dirty operations
    def user!(self) do
      User.read!(self.user_id)
    end
  end

  # this defines a table with other attributes as ordered set, and defines an
  # additional index as email, this improves lookup operations
  deftable User, [{ :id, autoincrement }, :name, :email], type: :ordered_set, index: [:email] do
    # again not needed, but nice to have
    @type t :: %User{id: non_neg_integer, name: String.t, email: String.t}

    # this is a helper function to add a message to the user, using write
    # on the created records makes it write to the mnesia table
    def add_message(self, content) do
      %Message{user_id: self.id, content: content} |> Message.write
    end

    # like above, but again with dirty operations, the bang methods are used
    # thorough amnesia to be the dirty counterparts of the bang-less functions
    def add_message!(self, content) do
      %Message{user_id: self.id, content: content} |> Message.write!
    end

    # this is a helper to fetch all messages for the user
    def messages(self) do
      Message.read(self.id)
    end

    # like above, but with dirty operations
    def messages!(self) do
      Message.read!(self.id)
    end
  end

end