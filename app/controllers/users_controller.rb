# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy assign_book]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # {add_index :bookmarks, [:pin_id, :user_id], unique: true}

  # GET /users/1 or /users/1.json
  def show
    @assigned_book = AssignedBook.new
    @borrowed_books = @user.borrowed_books
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  def assign_book
    @assigned_book = @user.assigned_books.build(assign_params)

    respond_to do |format|
      if @assigned_book.save && @assigned_book.book.update_attribute(:available, false)
        format.html { redirect_to @user, notice: "#{@assigned_book.book.name} was successfully borrowed." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to @user }
        flash.alert = 'Book assigning was unsuccessful, do well to fill all fields'
        format.json { render json: @assigned_book.errors, status: :unprocessable_entity }
      end
    end
  end
  # POST /users or /users.json

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = params[:id] ? User.find(params[:id]) : User.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def assign_params
    params.require(:assigned_book).permit(:book_id, :return_date)
  end
end
