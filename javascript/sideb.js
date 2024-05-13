function toggleMenu() {
    var sidebar = document.getElementById('sidebar');
    if (sidebar.style.left === '-300px') {
        sidebar.style.left = '0'; // aparecer sidebar
    } else {
        sidebar.style.left = '-300px'; // esconder sidebar
    }
}
