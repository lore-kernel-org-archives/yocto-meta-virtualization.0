Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.10854.1627571496500472843
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 08:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBEE4GlF;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gs8so11230929ejc.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pec1cN/gBcd/p6kMq1NvH7hjb0Xb0Yg35ly8XQ6v6hE=;
        b=OBEE4GlF7sRe38290Y3lXI2Cr2Svie2u+BNMfED4jJHE+U8zfEXqgoMGQL82cJfizH
         51JVXaCxzDOb16YwTfbT9LRzifqiaKwnMSr44m3JNfqUMwjAs+wY2cElkvW090aZunM7
         Kn+33X9NRpDQ8SwZT1A0bKCCJ4tMP+JWAqKfcGl/UcrtGAkQtwVu6b9BriNVCUDyXM/Y
         K0um0yfzUtTFXfVVDiO43Aw0uMX13tdgVwt6ZyRTINNyA+p1UoztIexMKrYmQBqlCqIT
         l0/Rwizjt3qscvRZ72HE1b93nPOtwzGWQpiSlhBMqfgOMiWq8YDleIKlW+yBmyK89VME
         W0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pec1cN/gBcd/p6kMq1NvH7hjb0Xb0Yg35ly8XQ6v6hE=;
        b=uiZsb2o5dNffsd1as2BxBZ4b73IzFWDD1E/F5gZqjqW8mCyRxaKj6xM0ru5vAJkMaV
         4eB1L38D3LBcGd/aDG8moXfpB6wC53FA5UxB/NWmIYrZoT3r6WrUv1bgDewxbDkIjp4/
         roCkrYtbimjEr4Q+qHzWtC6AzhpzmCC4oUPFD87Q2PbUNkmB5IdqIDnPG1YkIuxxN3YX
         EOleJ+aiPEMp58S2ZK3S7ruT4X/4TCmGnBLbw8Hpahyn9BKTtlX10GyXz2XnJYeENA7U
         d4rAxzTAJITOQ9paWtu0EPTVL3oOUhALKF2+Zv58L9FXroBk9nR3WW4yzx2lQ1PIHMOb
         UgbQ==
X-Gm-Message-State: AOAM5305DU5d5YKn/WV0C+9Ouaay+98HxTM2lA4VVSQl6CLvVL0aph5/
	XmalqjcxWo60MywJqHk62fL5fcSzpr2M1p7PzZ8=
X-Google-Smtp-Source: ABdhPJyApm5BC17XRU2c/Avo8jTbxt22hOqOQwmia7lqK/fj/xgKHYythUTdDnM8odoSBulSTsK4ZFZFdkL1pjBysnE=
X-Received: by 2002:a17:906:784:: with SMTP id l4mr5073695ejc.357.1627571494429;
 Thu, 29 Jul 2021 08:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <16964AC0B54EBA53.13113@lists.yoctoproject.org>
In-Reply-To: <16964AC0B54EBA53.13113@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 29 Jul 2021 11:11:23 -0400
Message-ID: <CADkTA4M8s-p+EyQtsQEOM-VW61Ga=k-H761rwYb6nTpZSk-ioQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Overrides syntax conversion
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c5a5d405c844841f"

--000000000000c5a5d405c844841f
Content-Type: text/plain; charset="UTF-8"

And I immediately had to rebase and tweak the commit a bit, you'll still
find it at the top of master-next:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-next&id=917c02a836ad6f538b7fbc0599cfbab9ea21fdb9

On Thu, Jul 29, 2021 at 10:55 AM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

> Hi all,
>
> Just a heads up that I've started the overrides conversion to the new
> bitbake syntax. I won't be pushing this for a few more weeks, but I wanted
> to let everyone know.
>
> The details are here:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-next&id=d8493d7091dbfa402b3c25d51c5d5417bac6d617
>
> If you have any cycles, feel free to build/runtime test your components
> and send incremental patches to the one I have on master-next.
>
> Cheers,
>
> Bruce
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c5a5d405c844841f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">And=
 I immediately had to rebase and tweak the commit a bit, you&#39;ll still f=
ind it at the top of master-next:</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small"><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virt=
ualization/commit/?h=3Dmaster-next&amp;id=3D917c02a836ad6f538b7fbc0599cfbab=
9ea21fdb9">https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/c=
ommit/?h=3Dmaster-next&amp;id=3D917c02a836ad6f538b7fbc0599cfbab9ea21fdb9</a=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jul 29, 2021 at 10:55 AM Bruce Ashfield via <a href=3D"h=
ttp://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;bruce.ashfield=
=
=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoc=
toproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-si=
ze:small">Hi all,</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Just a =
heads up that I&#39;ve started the overrides conversion to the new bitbake =
syntax. I won&#39;t be pushing this for a few more weeks, but I wanted to l=
et everyone know.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">The det=
ails are here: <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-v=
irtualization/commit/?h=3Dmaster-next&amp;id=3Dd8493d7091dbfa402b3c25d51c5d=
5417bac6d617" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/=
meta-virtualization/commit/?h=3Dmaster-next&amp;id=3Dd8493d7091dbfa402b3c25=
d51c5d5417bac6d617</a></div><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">If you have any cycles, feel free to build/runt=
ime test your components and send incremental patches to the one I have on =
master-next. </div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div>-- <br>=
<div dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf,=
 Star Trek II<br><br></div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--000000000000c5a5d405c844841f--
