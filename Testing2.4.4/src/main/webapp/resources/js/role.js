function changeAttribute(role) {
    if (role == 'ROLE_USER') {
        $('option.user:last').attr('selected', '');
    } else if (role == 'ROLE_ADMIN') {
        $('option.admin:last').attr('selected', '');
    } else {
        alert('error')
    }
}