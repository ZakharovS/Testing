$(document).ready(function () {
    var hide = $('.editUsers');
    hide.click(function () {
        $(this).next().toggle(150);
    });

    $('.editUsersPlus .btn').click(function () {
        var currentUser = $(this).parent('.editUsersPlus');
        var userName = currentUser.prev().html();
        var nickName = currentUser.find('#nickName').val();
        var eMail = currentUser.find('#eMail').val();
        var password = currentUser.find('#password').val();
        var role = currentUser.find('#role').val();
        $.ajax({
            type: "POST",
            url: "/usersEdit",
            data: {
                userName: userName,
                nickName: nickName,
                eMail: eMail,
                password: password,
                role: role
            },
            success: function (html) {
                window.location.reload();
            }
        });
        alert('777');
    });
});