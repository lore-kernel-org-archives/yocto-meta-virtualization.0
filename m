Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD8ED149CD
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 17:19:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.1066.1729876762113351691
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 10:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auGfQ9+g;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2e050b1c3so2350797a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Oct 2024 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729876761; x=1730481561; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5jVO6wtjNbkhajERaBsfhlTz/WoqYEpfEET/r+9leeA=;
        b=auGfQ9+g1Tyf30lNNqQOE5MHGp68ggtmPfcp69fU5s9u/cGmR3+daNN/hWpLcRKi/J
         yvAg7MmjIDjRdz7jb7HqjNQnIqbkMsgZ/uWdXael3krctIaNwbsnVz9IZsHrc8ozFCiy
         sJVWJa1XoXC8E+lUEc19Wn+SijQdPcZwU3PTl4Jvh1OuyBIAW6hP1wp6X227Cs7DPTS8
         s40LgSONkOHinrGFJvRmv332F/Lghma6YEAJsz17jUp1MZ4ryv7+xHO/47fFjGXtFAbA
         +AP9783V0LRMd7mjykKYdrb0ah2zUdEqlq3M0jnKR0/917hmlzGX5cbesR5mG8Tayr9d
         fX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876761; x=1730481561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jVO6wtjNbkhajERaBsfhlTz/WoqYEpfEET/r+9leeA=;
        b=WxsYYwx0vefqQXRVNuaLzkcbAWnWK6Z/kap+z6QQrImOevXNb9SL9Vd7zKjygMFGTN
         H2KfNImCez9D8td9XtUTWmdCfsVdFZpZUOTBgvJmjOWxDysIsRwSJ/ZD0391fSUzEO1G
         7XB13cmAuKG3eqnzsJGVSXkH1J2F4C6gAgOhDxodFzc44RA27ICyIvit8Z7HSP0Z+SC/
         n8EB99bwMR9DCn7swcX4fa3mI2XnSzmK5g/hKAxQF/AJ3ZIwONl6QZnFPBIgzCRVcM83
         vGNir54Qo+ClgK2k9QPklDkngiHxsm57uwKS2Zv7xoFwrlqEAFiouDFKHJ4gGFyvO8MN
         SZ1w==
X-Gm-Message-State: AOJu0Yy3Tn3xWv0XNeRRHUDA5WJUg6zwHjMK6ERfwEhwdNwVjMGT+wr3
	71XxtPZ4TbP2lpLvAVb62wRIZMWPd0OcbE23kE8cgBfDdWSd8awWxCZ4YSAREb652+Lfh3BH5xg
	i4GEaSeaifszgOCtOz3/OmRcwu1w=
X-Google-Smtp-Source: AGHT+IHN+SJwuiz64b67z+1PtVb9RLrMco0T78CaRH7Vg1faBpxBnp1QF82GIc643DkNXI/fKt+dSrSVuJwZeLcp1cI=
X-Received: by 2002:a17:90a:1508:b0:2e2:af80:8f7a with SMTP id
 98e67ed59e1d1-2e8f08854bemr322686a91.20.1729876761272; Fri, 25 Oct 2024
 10:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <14c95bc9-8cd2-4c24-8b9b-cf8bb53f860a@googlemail.com>
In-Reply-To: <14c95bc9-8cd2-4c24-8b9b-cf8bb53f860a@googlemail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Oct 2024 13:19:09 -0400
Message-ID: <CADkTA4NsT2xQbd7HCq19GB=vSvRAXtFaT637hj-R+xKZK=KFCQ@mail.gmail.com>
Subject: Re: [meta-virtualization] How to write a recipe that downloads a
 docker image and puts it into the (readonly) root file system
To: matthias.schoepfer@googlemail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dc6bf1062550512d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Oct 2024 17:19:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8936

--000000000000dc6bf1062550512d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 8:49=E2=80=AFAM Matthias Schoepfer via
lists.yoctoproject.org <matthias.schoepfer=3D
googlemail.com@lists.yoctoproject.org> wrote:

> Hi!
>
> I have been searching the web but have only found tons of stuff how to
> build a yocto image in a docker container, and some how to build a
> container from a yocto recipe. I need to embed a (couple of) (docker)
> containers into a readonly root file system. It is meant to be an
> intermediate step before simply integrating all the services directly
> into the image. What can I say.
>
> My Idea is to for example podman pull the image and redirect the storage
> location into the ${D} space. On the machine, it should be possible to
> configure podman to include this directory.
>

There's been several posts on the list, and even a session at one of
the hands-on labs (I think it was within the last year), talking about
doing just that.

For both technical and architectural reasons, those approaches aren't
something that will merge into OE core, or meta-virtualization.  The
reasons have been discussed in those other threads, so I won't repeat
them here as I'm a bit short on time, but didn't want to leave this
unanswered (there are licensing, compatibility, traceability,
reproducibility,
etc, issues).

For meta-virtualization, I call it "cross installation of containers", and
while it could support (and I'm leaving that door open) 3rd party built
containers, it is targeted for containers that have been built with the
yocto project itself.  The external containers will be an exercise left
up to people in their own layers.


> While I can pull images on my host, when I try to write a recipe
> (extending podman to be -native), I get all kinds of funny errors...
> Also tried buildah.
>

That all being said, there is work being completed in this area, and
I'm starting to push some of the support bits to master-next right now.

That includes a native set of tools, since in order for it to get into
meta-virtualization, it has to work with all the runtimes. I already have
podman, containerd, etc, working, docker is still the outlier that I'm
trying to get working without special permissions.

While waiting for that, you can easily work around the need for
-native versions of the yocto tools. I've done plenty of prototyping
with build machine container tools and haven't had any issues
(and in fact those talks and hands on classes I mentioned are
doing that as well).

The problem with docker is that the container file system storage
isn't the OCI standard, and it really isn't documented in a way that
I've been able to understand yet. So you can run docker on the
build host, pull a container to make it available and then copy it
into the target rootfs while it is being built .. having it show up to
the target docker and be "runnable" is the challenge.

I'm playing around with running the target in qemu during the
build and letting docker install that way. But I'm not happy ith
it yet.

Alternatively, if you are running a fully read only rootfs, your
container state is going to be lost when they exit (and after
a reboot), so you could just mount a tmpfs over the container
store, have the containers available in the readonly rootfs and
have docker import them on first boot.

podman has some extra flexibility as it is using a container store
that is manipulated by OCI tool so you can more easily run podman
on the build host and install it to the target rootfs and have it
show up as runnable.

Which takes me back to my first statement that for this to land
in meta-virt, I need all the container runtime options working, which
is what is taking the extra time.

Bruce


>
> Sorry, I am noob in the side of the containers and their format. I
> always tried to avoid them, as they seem to me as an option to "just
> static link everything" to not have to bother with dependency issues.
>
> Any hints and links are welcome.
>
> ```
>
> [storage.options]
> # Storage options to be passed to underlying storage drivers
>
> # AdditionalImageStores is used to pass paths to additional Read/Only
> image stores
> # Must be comma separated list.
> additionalimagestores =3D [
> ]
> ```
>
> Thanks and Regards,
>
>      Matthias
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8935):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8935
> Mute This Topic: https://lists.yoctoproject.org/mt/109206904/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000dc6bf1062550512d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 25, 2024 at 8:49=E2=80=AFAM Matthias Sc=
hoepfer via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lis=
ts.yoctoproject.org</a> &lt;matthias.schoepfer=3D<a href=3D"mailto:googlema=
il.com@lists.yoctoproject.org" target=3D"_blank">googlemail.com@lists.yocto=
project.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi!<br>
<br>
I have been searching the web but have only found tons of stuff how to <br>
build a yocto image in a docker container, and some how to build a <br>
container from a yocto recipe. I need to embed a (couple of) (docker) <br>
containers into a readonly root file system. It is meant to be an <br>
intermediate step before simply integrating all the services directly <br>
into the image. What can I say.<br>
<br>
My Idea is to for example podman pull the image and redirect the storage <b=
r>
location into the ${D} space. On the machine, it should be possible to <br>
configure podman to include this directory.<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">There&#39;s bee=
n several posts on the list, and even a session at one of</div><div class=
=3D"gmail_default" style=3D"font-size:small">the hands-on labs (I think it =
was within the last year), talking about</div><div class=3D"gmail_default" =
style=3D"font-size:small">doing just that.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">For both technical and architectural reasons, those appro=
aches aren&#39;t</div></div><div class=3D"gmail_default" style=3D"font-size=
:small">something=C2=A0that will merge into OE=C2=A0core, or meta-virtualiz=
ation.=C2=A0 The</div><div class=3D"gmail_default" style=3D"font-size:small=
">reasons have been discussed in those other threads, so I won&#39;t repeat=
</div><div class=3D"gmail_default" style=3D"font-size:small">them here as I=
&#39;m a bit short on time, but didn&#39;t want to leave this</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">unanswered (there are licens=
ing, compatibility, traceability, reproducibility,</div><div class=3D"gmail=
_default" style=3D"font-size:small">etc, issues).</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">For meta-virtualization, I call it &quot;cross ins=
tallation of containers&quot;, and</div><div class=3D"gmail_default" style=
=3D"font-size:small">while it could support (and I&#39;m leaving that door =
open) 3rd party built</div><div class=3D"gmail_default" style=3D"font-size:=
small">containers, it is targeted for containers that have been built with =
the</div><div class=3D"gmail_default" style=3D"font-size:small">yocto proje=
ct itself.=C2=A0 The external containers will be an exercise left</div><div=
 class=3D"gmail_default" style=3D"font-size:small">up to people in their ow=
n layers.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
While I can pull images on my host, when I try to write a recipe <br>
(extending podman to be -native), I get all kinds of funny errors... <br>
Also tried buildah.<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">That all being said, there is work bein=
g completed in this area, and</div></div><div>I&#39;m starting to push=C2=
=A0<span class=3D"gmail_default" style=3D"font-size:small">some of the supp=
ort bits to master-next right now.</span><br></div><div><span class=3D"gmai=
l_default" style=3D"font-size:small"><br></span></div><div><span class=3D"g=
mail_default" style=3D"font-size:small">That includes a native set of tools=
, since in order for it to get into</span></div><div><span class=3D"gmail_d=
efault" style=3D"font-size:small">meta-virtualization, it has to work with =
all the runtimes. I already have</span></div><div><span class=3D"gmail_defa=
ult" style=3D"font-size:small">podman, containerd, etc, working, docker is =
still the outlier that I&#39;m</span></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">trying to get working without special permissio=
ns.</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">While waiting f=
or that, you can easily work around the need for</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">-native versions of the yocto tools. I&#3=
9;ve done plenty of prototyping</div><div class=3D"gmail_default" style=3D"=
font-size:small">with build machine container tools and haven&#39;t had any=
 issues</div><div class=3D"gmail_default" style=3D"font-size:small">(and in=
 fact those talks and hands on classes I mentioned are</div><div class=3D"g=
mail_default" style=3D"font-size:small">doing that as well).</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">The problem with docker is that the con=
tainer file system storage</div><div class=3D"gmail_default" style=3D"font-=
size:small">isn&#39;t the OCI standard, and it really isn&#39;t documented =
in a way that</div><div class=3D"gmail_default" style=3D"font-size:small">I=
&#39;ve been able to understand yet. So you can run docker on the</div><div=
 class=3D"gmail_default" style=3D"font-size:small">build host, pull a conta=
iner to make it available and then copy it</div><div class=3D"gmail_default=
" style=3D"font-size:small">into the target rootfs while it is being built =
.. having it show up to</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">the target docker and be &quot;runnable&quot; is the challenge.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">I&#39;m playing aroun=
d with running the target in qemu during the</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">build and letting docker install that way. Bu=
t I&#39;m not happy ith</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">it yet.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Alternat=
ively, if you are running a fully read only rootfs, your</div><div class=3D=
"gmail_default" style=3D"font-size:small">container state is going to be lo=
st when they exit (and after</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">a reboot), so you could just mount a tmpfs over the container=
</div><div class=3D"gmail_default" style=3D"font-size:small">store, have th=
e containers available in the readonly rootfs and</div><div class=3D"gmail_=
default" style=3D"font-size:small">have docker import them on first boot.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">podman has some extra flex=
ibility as it is using a container store</div><div class=3D"gmail_default" =
style=3D"font-size:small">that is manipulated by OCI tool so you can more e=
asily run podman</div><div class=3D"gmail_default" style=3D"font-size:small=
">on the build host and install it to the target rootfs and have it</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">show up as runnable.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Which takes me back to my =
first statement that for this to land</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">in meta-virt, I need all the container runtime optio=
ns working, which</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">is what is taking the extra time.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Sorry, I am noob in the side of the containers and their format. I <br>
always tried to avoid them, as they seem to me as an option to &quot;just <=
br>
static link everything&quot; to not have to bother with dependency issues.<=
br>
<br>
Any hints and links are welcome.<br>
<br>
```<br>
<br>
[storage.options]<br>
# Storage options to be passed to underlying storage drivers<br>
<br>
# AdditionalImageStores is used to pass paths to additional Read/Only <br>
image stores<br>
# Must be comma separated list.<br>
additionalimagestores =3D [<br>
]<br>
```<br>
<br>
Thanks and Regards,<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 Matthias<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8935): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8935" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8935</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109206904/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109206904/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000dc6bf1062550512d--

