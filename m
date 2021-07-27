Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.6110.1627352362962744816
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 19:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vbCvjvHW;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id x14so8466826edr.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jul 2021 19:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ok+YvecjPaZ0J2LVQIXKlaopWVyUZIzoYMjUfpd5IkY=;
        b=vbCvjvHWoO93LR1NTc4vSyFw5LSTQelHloUD5egijI6ptl3wcHOkJKGQCXe5x3xcIm
         2IKVjqEuPc3X9RaDUbdMvFGrXM1eXxabwxZnFfbld7cBCZgQCJKyiLs/YRCnxdKkldyR
         QlNxMJaLMoMnkKgfd+BeTkvjz9i/EW7BvhSi+xzCZFWMnIAvyMWk3dIIgIiigrpzjO24
         doUpo319LTm+nbARp4xzakUSK3FB1sRlcN2oGfKl3pOoiSlSbbu2RVOTq5NcLIlBU0Yq
         3fKjwUyCmW46XWl9m40ytt5kmIc/HC8GBPGqvWGfnDZSyE7A0aAl/IPKB3htpMacDK6r
         M2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ok+YvecjPaZ0J2LVQIXKlaopWVyUZIzoYMjUfpd5IkY=;
        b=i8eJ5luKADddlnb2qxgZC3qxkHGInLC6lzRKgM81yvJFYE2hDzRo1PgMvrxrc1nuJO
         /IQ9GUXett1eHsK5ZkxDSLb10xKncnkrz5FDMr74WyIIxOO427Y0ZfYSfmDIDIonHiwj
         2hwyWk0xmav+hwh6TziePAl9QnUU9C25GFqe+PBZzpRvBjmghtXmrtf9aokZAk13tvNA
         GzyAuXVOVYGwZTdGcrk6ngIt9HCRR//hvYZ0HeiEb9PEsPOHav0w/IoP9ckSUK9WRFKg
         9RxSH3h+5l229TOiCodJjbYD4/fcGcyCMcrOpbqf7wmhwX38WyFFSq6FJG1yywrM5qwS
         VQQg==
X-Gm-Message-State: AOAM5318fupL69W+Q+uXEBpPFQSPcc9THmycuqf0dFyxAX91U7vZNaCu
	BNn/YCaOJt+HKA5V/di4uAQz91n4h0xAEgvp5AA=
X-Google-Smtp-Source: ABdhPJzqcJSMgMxKD8S7brzN+5pcvfQhl96HAJStGBhkKj/lmcUsEvEBb1Lov0x4Ic8cwKy/4Vuj6f7uP227M0u3gko=
X-Received: by 2002:a50:af85:: with SMTP id h5mr1744764edd.27.1627352361520;
 Mon, 26 Jul 2021 19:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210726185823.26402-1-fib@cisco.com>
In-Reply-To: <20210726185823.26402-1-fib@cisco.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 26 Jul 2021 22:19:10 -0400
Message-ID: <CADkTA4OD0XG7m8QqVeWd8Zv4ynKaGeYAFGCtSv6FaTdwssApyQ@mail.gmail.com>
Subject: Re: python3: remove no longer needed bbappend
To: Ruslan Babayev <fib@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006ed44005c8117f2c"

--0000000000006ed44005c8117f2c
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 26, 2021 at 2:58 PM Ruslan Babayev <fib@cisco.com> wrote:

>
> Bruce, I am resending the v3 which completely removes the bbappend
> when virtualization is found in DISTRO_FEATURES.  As you mentioned the
> bbappend originates all the way from python2 days and is no longer
> required. More importantly, it causes the breakage of python3-native
> recipe.
>

Yup, that's the right thing to do. I've queued it for my local testing now.

Bruce



>
> Thanks,
> Ruslan
>
>
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006ed44005c8117f2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 26, 2021 at 2:58 PM Ruslan Babayev &lt;=
<a href=3D"mailto:fib@cisco.com">fib@cisco.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
Bruce, I am resending the v3 which completely removes the bbappend<br>
when virtualization is found in DISTRO_FEATURES.=C2=A0 As you mentioned the=
<br>
bbappend originates all the way from python2 days and is no longer<br>
required. More importantly, it causes the breakage of python3-native<br>
recipe.<br></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Yup, that&#39;s the right thing to do. I&#39;ve que=
ued it for my local testing now.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Thanks,<br>
Ruslan<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000006ed44005c8117f2c--
