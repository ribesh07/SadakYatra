const editForm = document.getElementById('editForm');
const editBtns = document.querySelectorAll('.edit-btn');

editBtns.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    const userId = btn.getAttribute('data-user-id');
    const firstName = btn.getAttribute('data-first-name');
    const lastName = btn.getAttribute('data-last-name');
    const email = btn.getAttribute('data-email');

    editForm.style.display = 'block';
    document.getElementById('userId').value = userId;
    document.getElementById('firstName').value = firstName;
    document.getElementById('lastName').value = lastName;
    document.getElementById('email').value = email;
  });
});