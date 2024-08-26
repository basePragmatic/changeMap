class BookPolicy
    attr_reader :user, :book

    def initialize(user, book)
      @user, @book = user, book
    end

  def destroy?
    user.permission?(:manage_all_books) || (user.permission?(:manage_books) && book.dept == user.dept)
  end
end