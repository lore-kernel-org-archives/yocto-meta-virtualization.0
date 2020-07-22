Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.23812.1595437754351609792
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jul 2020 10:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X4LuYC6H;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id q74so3358630iod.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jul 2020 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MVL29XA66Y1OFzM9Kav7NJSHW8236tJ5hi/m9rI7Q1c=;
        b=X4LuYC6HTVP38H36H49WTeN8eHPkKFN9ivAUhJoFNn23VFuWgO//ZdtlJigklOP0uV
         /pBlMMId1dRJl387czl+NHzFkHBhESltNdl9K3nd6E8NFku2ky8VlKeDV2My0fiXUXWR
         4KhFnSsn1WKuU2kHcIDoqzTCk7ap6vqgHkpr+e24pVVQpIpDUZfDidemgzI0qatLq0PQ
         uy+DsERzixHlBTN5aLkicE7WhD/xb3mt61xdfqFEtO510XDS0IQGQiDQ8bg7nhDG2sky
         bD0dQlKAap8YSGwvOnv/SrqCuagL99LKYSCzZSKprK7ZWD+1aj/6L7NqfppOUjU1rK+u
         Chcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MVL29XA66Y1OFzM9Kav7NJSHW8236tJ5hi/m9rI7Q1c=;
        b=JCYT7eeCK0W8UqK7L9Qodq5Glx4MKXe8Fy8TkJiOiI0NTRrvGgCBPlYcOoSo1gyTWf
         64taB7Wk+WIiS/jYRVD0/o/t+C1NIE2uorb8bOQbOVVDleLHc2hRfnsiPn/Usw230Elq
         otAllX8uXayNUVKIpIntmZNprKrCGqCbJeAh8zWt/J35RMVXp8Gz9ohHHRO841h9Uzw1
         YWYc22gLH+HnBP7MLYrJGny+nLDkIkza8AhzUdqEOEz2xQ9RYzGn4UVN3qk6YL4z0SqL
         j4IEyEIiItO/ODfqnsfcDAnOS6U51ZwlDv/VJamJhtXh+eOWEO3OWs36PSZSxYTfctPm
         jdXw==
X-Gm-Message-State: AOAM533enX0Dy9DXuknWZxTpTLX8ruQPfefKNvWLvud9oLcViIys2Fpm
	lMKYf5lUzHl65LqSo/5w7zPWG+C4QmAiJVtajIU=
X-Google-Smtp-Source: ABdhPJw1rRJWkaiveGkVUScvSO/VDVK59CjJJj7lkd7UyvpMxK+X/c4JZTkwK6ICuQr7qx/Y5VKzUlwxbPcWgkHP8DA=
X-Received: by 2002:a02:1d04:: with SMTP id 4mr255992jaj.16.1595437753627;
 Wed, 22 Jul 2020 10:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <13067.1595428363223233314@lists.yoctoproject.org> <22407.1595430430176631216@lists.yoctoproject.org>
In-Reply-To: <22407.1595430430176631216@lists.yoctoproject.org>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Wed, 22 Jul 2020 22:39:01 +0530
Message-ID: <CAEkELtCEeJ8iN8d1nddN2sW+isaN559Wow3+W6-dsLZQmgrP6g@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: Ashish <ashishm@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000090f50705ab0accc9"

--00000000000090f50705ab0accc9
Content-Type: text/plain; charset="UTF-8"

Thank you so much sir.


Yes sir really we should be verymuch thankful Christopher sir.

Thank you sir.

On Wed, 22 Jul, 2020, 8:37 PM Ashish, <ashishm@mvista.com> wrote:

> Hi Siddhartha ,
>
> Let us help you by :
>
> 1)  You can create an patch by " git format-patch -1 " .
>       This will create patch of current HEAD
>
> 2)  You can get Christopher patches by below two ways :
>        a) Clone meta-virtualization
>                - Checkout the commit ( d75bc448866d2b36779251efb1310d0234ece30b
> ) shared by Chris in his input to us.
>                -  Apply the required patches  ( sharing an tar of patches
> just so that you can proceed ahead )
>                   Attached along is the tar with patches
> *  patch-folder-siddharth.tar*               - Patches can be applied by
> :
>                       $ git apply --check
> <patch-folder/0001-libvirt-fix-patch-fuzz-warning.patch>
>                       $ git am
> <patch-folder/0001-libvirt-fix-patch-fuzz-warning.patch>    ( if apply
> --check doesn't generates an error )
>
>       b) Clone his personal repo and switch to branch
>            $ git clone https://github.com/dozylynx/meta-virtualization
> <https://github.com/dozylynx/meta-virtualization>
>            $ git checkout raspberry-pi4-xen-series
> <https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-xen-series>
>
> 3)  Add below in your conf/local.conf
>      QEMU_TARGETS ="i386 x86_64 aarch64 arm"
>      DISTRO_FEATURES_append = " xen virtualization"
>      MACHINE = "raspberrypi4-64"
>
> 4)  Also as a suggestion start with clean repo.
>      - Generally i share the error as log attachment & keep only error
> message on mail.
>        This makes going through the thread simpler .
>        Again this is not some hard rule but sharing my experience .
>
> 5)  w.r.t grip on Yocto , we all keep on learning as Yocto has a steep
> learning curve but its worth all the effort for such a great tool .
>
> We as an community need to be thankful to Christopher for his effort !!
>
> Hope it helps !!
>
>
> 
>

--00000000000090f50705ab0accc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you so much sir.<div dir=3D"auto"><br></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Yes sir really we should be verymuch=
 thankful Christopher sir.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thank you sir.=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 22 Jul, 2020, 8:37 PM Ashish, &lt;<a=
 href=3D"mailto:ashishm@mvista.com">ashishm@mvista.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hi Siddhartha ,=C2=A0<br><br>Let us help=
 you by :<br><br>1)=C2=A0 You can create an patch by &quot; git format-patc=
h -1 &quot; . <br>=C2=A0 =C2=A0 =C2=A0 This will create patch of current HE=
AD<br><br>2)=C2=A0 You can get Christopher=C2=A0patches by below two ways :=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0a) Clone meta-virtualization=C2=A0<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Checkout the commit (=C2=
=
=A0<span style=3D"white-space:pre-wrap">d75bc448866d2b36779251efb1310d0234=
ece30b ) </span>shared by Chris in his input to us.=C2=A0<br>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 Apply the required patche=
s=C2=A0 ( sharing an tar of patches just so that you can proceed ahead )=C2=
=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Atta=
ched along is the tar with patches<strong>=C2=A0 patch-folder-siddharth.tar=
<br></strong>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Patch=
es can be applied by :=C2=A0=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git apply --check &lt;patch-fo=
lder/0001-libvirt-fix-patch-fuzz-warning.patch&gt;<br>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git am &lt;patch=
-folder/0001-libvirt-fix-patch-fuzz-warning.patch&gt;=C2=A0 =C2=A0 ( if app=
ly --check doesn&#39;t generates an error )=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 b) Clone his personal repo and switc=
h to branch=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$=C2=A0<span =
style=3D"color:#222222;font-family:Arial,Helvetica,sans-serif;font-size:sma=
ll">git clone=C2=A0</span><a style=3D"background-color:#ffffff;color:#23527=
c;text-decoration-line:underline;outline:0px" href=3D"https://github.com/do=
zylynx/meta-virtualization" rel=3D"nofollow noopener noreferrer" target=3D"=
_blank">https://github.com/dozylynx/meta-virtualization=C2=A0</a><br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$ git checkout=C2=A0<a style=3D"backgrou=
nd-color:#ffffff;white-space:pre-wrap" href=3D"https://github.com/dozylynx/=
meta-virtualization/tree/raspberry-pi4-xen-series" rel=3D"noopener noreferr=
er" target=3D"_blank">raspberry-pi4-xen-series</a><br><br>3)=C2=A0 Add belo=
w in your conf/local.conf<br>
<div>=C2=A0 =C2=A0 =C2=A0QEMU_TARGETS =3D&quot;i386 x86_64 aarch64 arm&quo=
t;=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES_append =3D &quot; xen virtualizat=
ion&quot;=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0MACHINE =3D &quot;raspberrypi4-64&quot;=C2=A0</di=
v>
<div>=C2=A0</div>
4)=C2=A0 Also as a suggestion start with clean repo.<br>=C2=A0 =C2=A0 =C2=
=A0- Generally i share the error as log attachment &amp; keep only error m=
essage on mail.=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0This makes going throug=
h the thread simpler .=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Again this is no=
t some hard rule but sharing my experience .=C2=A0<br><br>5)=C2=A0 w.r.t gr=
ip on Yocto , we all keep on learning as Yocto has a steep learning curve b=
ut its worth all the effort for such a great tool .<br>=C2=A0<br>We as an c=
ommunity need to be thankful to Christopher for his effort !!<br><br>Hope i=
t helps !!<br><br>=C2=A0<br>
<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--00000000000090f50705ab0accc9--
