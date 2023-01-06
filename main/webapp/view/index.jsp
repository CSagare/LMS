<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LMS</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="style.css">
  <style><%@include file="/css/style.css"%></style>
</head>

<body>
  <nav class="navbar navbar-expand-sm bg-light navbar-light">
    <a class="navbar-brand" href="#">LMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Settings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
      <a class="nav-link" href="#">Hello</a>
        <li class="nav-item m-auto" id="profile-icon">
          <i class="bi bi-person-circle" style="font-size: 30px;"></i>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">	<%=session.getAttribute("username") %>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="container-fluid">
    <div class="row py-3">
      <div class="col-3 bg-light" id="sticky-sidebar">
        <div class="sticky-left">
          <div class="list-group w-100">
            <a href="#" class="list-group-item list-group-item-action font-weight-bold" onclick="loadBooksIframe()">Books</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#newBookModal">
              - Add a new book</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal"
              data-target="#issueBookModal"> - Issue book</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal"
              data-target="#newBookCategoryModal"> - New book category</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal"
            data-target="#deleteBookModal"> - Delete a book</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#searchBookModal"> - Search a book</a>
            <a href="#" class="list-group-item list-group-item-action font-weight-bold" onclick="loadMembersIframe()">Members</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#newMember"> - Add a new member</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#searchMember"> - Search a member</a>
            <a href="#" class="list-group-item list-group-item-action" > - Edit a member</a>
            <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#deleteBookModal"> - Delete a member</a>
          </div>
        </div>
      </div>
      <div class="col bg-light" id="main">
        <h1>Dashboard</h1>
        <div class="row">
          <div class="col-sm dash-items mx-3 bg-primary" id="total-members">
            <p>Total Members</p>
            <p class="total-value">1001</p>
          </div>
          <div class="col-sm dash-items mx-3 bg-success" id="total-books">
            <p class="">Total Books</p>
            <p class="total-value">5000</p>
          </div>
          <div class="col-sm dash-items mx-3 bg-dangerd" id="total-pending">
            <p>Total Pending</p>
            <p class="total-value">33</p>
          </div>

        </div>
        <div class="row mobile-sidebar mt-4">
          <h4>Menu</h4>
          <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="loadBooksIframe()">Books</button>
            <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              <span class="sr-only">Toggle Dropdown</span>
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#newBookModal">Add a new book</a>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#issueBookModal">Issue book</a>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#newBookCategoryModal">New book
                category</a>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#deleteBookModal">Delete a book</a>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#searchBookModal">Search a book</a>
            </div>
          </div>
          <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="loadMembersIframe()">Members</button>
            <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              <span class="sr-only">Toggle Dropdown</span>
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <a class="dropdown-item" href="#">Add a new member</a>
              <a class="dropdown-item" href="#">Search a new member</a>
              <a class="dropdown-item" href="#">Edit a member</a>
              <a class="dropdown-item" href="#">Delete a member</a>
            </div>
          </div>
        </div>
        <div class="row" id="frame">
          <div class="embed-responsive embed-responsive-21by9 iframe">
            <iframe class="embed-responsive-item" id="iframe" src="books.html"></iframe>
          </div>
        </div>
      </div>

      <div class="modal" id="newBookModal">
        <!-- Add a new book -->
        <div class="modal-dialog">
          <div class="modal-content">
            <form>
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Add a new book</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>

              <!-- Modal body -->
              <div class="modal-body" id="newBookModalBody">

                <div class="form-group" style="text-align: center; display: block;">
                  <i class="bi bi-camera" style="font-size: 5em;" title="Upload an image" id="issueBookScanIcon"></i>


                </div>
                <div class="form-group">
                  <label for="newBookId">Book ID</label>
                  <input type="text" class="form-control" id="newBookId" placeholder="Enter 8 digit number"
                    required>
                </div>
                <div class="form-group">
                  <label for="newBookName">Book Name</label>
                  <input type="text" class="form-control" id="newBookName" placeholder="Enter Book Name"
                    required>
                </div>
                <div class="form-group">
                  <label for="newBookAuthor">Book Author</label>
                  <input type="text" class="form-control" id="newBookAuthor" placeholder="Enter Author Name"
                    required>
                </div>
                <div class="form-group">
                  <label for="newBookCategory">Book Category</label>
                  <select class="form-control" id="newBookCategory">
                    <option>Category 1</option>
                    <option>Category 2</option>
                    <option>Category 3</option>
                    <option>Category 4</option>
                  </select>
                </div>
                <div class="row">
                  <legend class="col-form-label col-sm-2 pt-0">Reference</legend>
                  <div class="col-sm-5">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1"
                        checked>
                      <label class="form-check-label" for="gridRadios1">
                        Yes
                      </label>
                    </div>
                  </div>
                  <div class="col-sm-5">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                      <label class="form-check-label" for="gridRadios2">
                        No
                      </label>
                    </div>
                  </div>
                </div>

              </div>

              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </form>
          </div>

        </div>
      </div>
      <!-- Issue a book -->
      <div class="modal" id="issueBookModal">
        <div class="modal-dialog">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">Issue a new book</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" id="issueBookModalBody">
              <form>
                <div class="form-group" style="text-align: center;">
                  <i class="bi bi-upc-scan" style="font-size: 5em; margin: auto;" id="issueBookScanIcon"></i>
                </div>
                <div class="form-group">
                  <label for="issueBookModalBookId">Book ID</label>
                  <input type="text" class="form-control" id="issueBookModalBookId" placeholder="8 digit number">
                </div>
                <div class="form-group">
                  <label for="issueBookModalBookName">Book Name</label>
                  <input type="text" class="form-control" id="issueBookModalBookName"
                    placeholder="Enter a matching keyword">
                </div>
                <div class="form-group">
                  <label for="issueBookModalBookAuthor">Book Author</label>
                  <input type="text" class="form-control" id="issueBookModalBookAuthor"
                    placeholder="Enter a matching keyword">
                </div>
                <div class="form-group">
                  <label for="issueBookModalBookCategory">Book Category</label>
                  <input type="text" class="form-control" id="issueBookModalBookCategory"
                    placeholder="Enter a matching keyword">
                </div>
                <div class="form-group">
                  <label for="issueBookModalMemberId">Member ID</label>
                  <input type="text" class="form-control" id="issueBookModalMemberId" placeholder="8 digit number">
                </div>
                <div class="form-group">
                  <label for="issueBookModalMemberId">Member Name</label>
                  <input type="text" class="form-control" id="issueBookModalMemberName"
                    placeholder="Enter a matching keyword">
                </div>
              </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Save</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

          </div>
        </div>
      </div>

      <!-- New book category -->
      <div class="modal" id="newBookCategoryModal">
        <div class="modal-dialog">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">New Book Category</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" id="newBookCategoryBody">
              <form>
                <div class="form-group">
                  <label for="newBookCategoryName">Category</label>
                  <input type="text" class="form-control" id="newBookCategoryName" placeholder="Add a new Category">
                </div>
                <div class="form-group">
                  <label for="newBookCategoryDiscription">Discription</label>
                  <textarea class="form-control" rows="5" id="newBookCategoryDiscription"></textarea>
                </div>
              </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Save</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

          </div>
        </div>
      </div>

      <!-- Delete a book -->
      <div class="modal" id="deleteBookModal">
        <div class="modal-dialog">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">Delete a Book</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" id="deleteBookBody">
              <form>
                <div class="form-group">
                  <label for="deleteBookId">Book ID</label>
                  <input type="text" class="form-control" id="deleteBookId" placeholder="Enter Book ID">
                </div>
                <div class="form-group">
                  <label for="deleteBookName">Book Name</label>
                  <input type="text" class="form-control" id="deleteBookName" placeholder="Enter Book Name">
                </div>
                <div class="form-group">
                  <label for="deleteBookAuthor">Book Author</label>
                  <input type="text" class="form-control" id="deleteBookAuthor" placeholder="Enter Book Author">
                </div>
              </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Save</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

          </div>
        </div>
      </div>
      <!-- Search a book -->
      <div class="modal" id="searchBookModal">
        <div class="modal-dialog">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">Search a Book</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" id="searchBookBody">
              <form>
                <div class="form-group">
                  <label for="searchBookId">Search Field</label>
                  <input type="text" class="form-control" id="searchBookId" placeholder="Enter a matching keyword">
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="searchBookField" id="searchBookTitle" value="option2">
                  <label class="form-check-label" for="searchBookTitle">
                    Search By Title
                  </label>
                </div><div class="form-check">
                  <input class="form-check-input" type="radio" name="searchBookField" id="searchBookCategory" value="option2">
                  <label class="form-check-label" for="searchBookCategory">
                    Search By Category
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="searchBookField" id="searchBookAuthor" value="option2">
                  <label class="form-check-label" for="searchBookAuthor">
                    Search By Author
                  </label>
                </div>
              </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Save</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

          </div>
        </div>
      </div>
    </div>
     <!-- Add  member -->
          <div class="modal" id="newMember">
        <!-- Add a new member -->
        <div class="modal-dialog">
          <div class="modal-content">
            <form>
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Add a new Member</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>

              <!-- Modal body -->
              <div class="modal-body" id="newBookModalBody">

                <div class="form-group" style="text-align: center; display: block;">
                  <i class="bi bi-camera" style="font-size: 5em;" title="Upload an image" id="issueBookScanIcon"></i>


                </div>
                <div class="form-group">
                  <label for="newBookId">Book ID</label>
                  <input type="text" class="form-control" id="newBookId" placeholder="Enter 8 digit number"
                    required>
                </div>
                <div class="form-group">
                  <label for="newBookName">Book Name</label>
                  <input type="text" class="form-control" id="newBookName" placeholder="Enter Book Name"
                    required>
                </div>
                <div class="form-group">
                  <label for="newBookAuthor">Book Author</label>
                  <input type="text" class="form-control" id="newBookAuthor" placeholder="Enter Author Name"
                    required>
                </div>
              
                <div class="row">
                  <legend class="col-form-label col-sm-2 pt-0">Reference</legend>
                  <div class="col-sm-5">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1"
                        checked>
                      <label class="form-check-label" for="gridRadios1">
                        Yes
                      </label>
                    </div>
                  </div>
                  <div class="col-sm-5">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                      <label class="form-check-label" for="gridRadios2">
                        No
                      </label>
                    </div>
                  </div>
                </div>

              </div>

              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </form>
          </div>

        </div>
      </div>
          <!-- Search a book -->
      <div class="modal" id="searchMember">
        <div class="modal-dialog">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">Search a Member</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" id="searchBookBody">
              <form>
                <div class="form-group">
                  <label for="searchBookId">Search Field</label>
                  <input type="text" class="form-control" id="searchBookId" placeholder="Enter a name of Member">
                </div>
                
              </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Search</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

          </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"></script>
    <script src="app.js"></script>
</body>

</html>