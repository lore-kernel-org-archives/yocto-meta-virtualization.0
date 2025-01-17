Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E50BC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 03:41:46 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.3639.1737085303845583121
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 19:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CNmEIqUF;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so2325585a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jan 2025 19:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737085303; x=1737690103; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C47/eESvvqPdRQqpSj6X8kHmpq7PjEACpr3BrYIN6UM=;
        b=CNmEIqUFgQEq9exD6wL+cRftYPLgj/cxufwSXhA7kLeNBEcuXhquTTnh8hjDKRYrYV
         t3NEoIy7IXDLQBx7GH/vxfnV9ZwoaJt0tdOWYWx/UUpTfK/jp4csi5HORJWGXh3C/T9X
         cBx9jko67p7rt1GW+SdDAOEYX1gsAGUQEa01QzcoSEp5FKHL8apoLc9aQ8kUiV3I8aVy
         r7QgpH42FNzutXZsirS4FqbV0nlD7SXWA9U9akSUhLqZwXJWbOKFFlnnO0aSy8UYC7b/
         A99WJ/rjUpyTOzvl96fWXR6OcR6L5bgdLAl3Omw/ZB3V7rhadUHl0lHx7UNB/yrjnWCE
         k4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737085303; x=1737690103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C47/eESvvqPdRQqpSj6X8kHmpq7PjEACpr3BrYIN6UM=;
        b=SUxgcavykuprBVfLyHEiNPIMTdezqnumMz3Xi0erZlY3/aVD/7emVo5yOvxqfTQOg+
         GswNgcsuqkjCCwaRvUKVjcBhfMFj77IT6qHWLdFkpFgDHXqMaoydIfs31TBTF0CsymWc
         HnX1dBLkAs0kWU3hWF0mfQT2Tel0FCby7gePHlsNzS3HaBbYuy9A4Tu4NunOglIxpjm1
         +8PD2rir29fFLf5X344zWt11FMMjayB62Tzh8JpTt4eHSkmLY5LhGbPPbBoVREUjDQrZ
         fdW7Q2tbd/qP6P7XNafGR9Xdmm/qmvKNKcNlx5St6kb8S49VYIjb8kxOY8nEU0rRYGjS
         BfEA==
X-Gm-Message-State: AOJu0YzbQiybKQZZ/TjaJL8lY7CrRbdCq99iVWNKHxlV7rmpQA79JrsG
	6Ahk9npTiXa9PZBWrPC0kf3DOLE82FKoyFZz9xpCGNFphxz2HwrkSKQU8T3cThrEFwgUd78FLF1
	SkhjP7+TPoc9MKrRyPpBNscr1hDk=
X-Gm-Gg: ASbGncuTQToPsRO66e6X+HPj+yEhrVcQR5qcNzSEMjeskGQLKx7zOuPt+kqaXyPSgKu
	Qh0zwsUPiZXGHe3s4WO72eUaUi1tLpSdZ8IM1zQ==
X-Google-Smtp-Source: AGHT+IFvFMtFO7ni7YuIQFeffaRLPlXV9hZFS3p1Vec9/x9CJaUAabBD3aK9Ox+Ghf1qxaCq/30R+ilJl1rQO+EClDQ=
X-Received: by 2002:a17:90b:2b87:b0:2ee:a127:ba96 with SMTP id
 98e67ed59e1d1-2f782d36030mr1303449a91.23.1737085303028; Thu, 16 Jan 2025
 19:41:43 -0800 (PST)
MIME-Version: 1.0
References: <37Va.1737063179298829181.RVW3@lists.yoctoproject.org>
In-Reply-To: <37Va.1737063179298829181.RVW3@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 Jan 2025 22:41:31 -0500
X-Gm-Features: AbW1kvbLdwjCP24fG355VWyNiKj1-zuBfIGussyr-PlhzgXAjLGJjoZ_qlNBCAI
Message-ID: <CADkTA4MWMSSYuk5iOsD_YtNhbMXb9Cv_w9+qSNZ8E37sbmL+Pw@mail.gmail.com>
Subject: Re: [meta-virtualization] OCI image .tar installation
To: jcorichiherrejon@sgl.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006e84e1062bdeb077"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 03:41:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9095

--0000000000006e84e1062bdeb077
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 4:33=E2=80=AFPM Jorge C. via lists.yoctoproject.org
<jcorichiherrejon=3Dsgl.com@lists.yoctoproject.org> wrote:

> Hi all,
>
> I'm looking to install a .tar file that contains a container image into
> the rootfs; this .tar being a product of a podman pull/podman save
> commands.
> I've been going through the threads in the mailing list and watched some
> of the talks and demos about this but have not been able to figure it out
> and I was hoping I could find some guidance here.
>
> So far, I've created a recipe that attempts to:
> 1. `podman pull` a group of images I have declared in a manifest.
> 2. `podman save` the images to produce the .tar.
> 3.  Install the .tar along with a docker-compose.yml; on boot a service
> loads the containers from the .tar.
>
> The problem is that podman is not found and the tasks fail.
> I've been following the meta-embedded-containers repo
> <https://github.com/savoirfairelinux/meta-embedded-containers/tree/main>,
> but I would like to avoid passing podman through HOSTTOOLS.
>

> As I understand, using docker is not an option because it's not a native
> package, which is why I'm leaning for podman.
> Does someone know of another approach for copying the OCI image onto the
> directory?
>

I won't elaborate here, but if you search the list archives, we've
discussed this several times (as you mentioned).

As part of the upcoming LTS release, I'm going to complete my long-running
efforts for cross install of containers for all the supported runtimes.
Both podman and docker. That includes working native tools to manipulate
the container storage on the image.

Cheers,

Bruce



>
> Thanks.
> Jorge
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9094):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9094
> Mute This Topic: https://lists.yoctoproject.org/mt/110655785/1050810
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

--0000000000006e84e1062bdeb077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 16, 2025 at 4:33=
=E2=80=AFPM Jorge C. via <a href=3D"http://lists.yoctoproject.org">lists.yo=
ctoproject.org</a> &lt;jcorichiherrejon=3D<a href=3D"mailto:sgl.com@lists.y=
octoproject.org">sgl.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div>Hi all,</div>
<div>=C2=A0</div>
<div>I&#39;m looking to install a .tar file that contains a container image=
 into the rootfs; this .tar being a product of a podman pull/podman save co=
mmands.=C2=A0</div>
<div>I&#39;ve been going through the threads in the mailing list and watche=
d some of the talks and demos about this but have not been able to figure i=
t out and I was hoping I could find some guidance here.</div>
<div>=C2=A0</div>
<div>So far, I&#39;ve created a recipe that attempts to:</div>
<div>1. `podman pull` a group of images I have declared in a manifest.</div=
>
<div>2. `podman save` the images to produce the .tar.</div>
<div>3.=C2=A0 Install the .tar along with a docker-compose.yml; on boot a s=
ervice loads the containers from the .tar.</div>
<div>=C2=A0</div>
<div>The problem is that podman is not found and the tasks fail.</div>
<div>I&#39;ve been following the <a href=3D"https://github.com/savoirfairel=
inux/meta-embedded-containers/tree/main" rel=3D"noopener" target=3D"_blank"=
>meta-embedded-containers repo</a>, but I would like to avoid passing podma=
n through HOSTTOOLS.=C2=A0</div></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<div>=C2=A0</div>
<div>As I understand, using docker is not an option because it&#39;s not a =
native package, which is why I&#39;m leaning for podman.</div>
<div>Does someone know of another approach for copying the OCI image onto t=
he directory?</div></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I won&#39;t elaborate here, but if you sear=
ch the list archives, we&#39;ve discussed this several times (as you mentio=
ned).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">As part of the upco=
ming LTS release, I&#39;m going to complete my long-running efforts for cro=
ss install of containers for all the supported runtimes. Both podman and do=
cker. That includes working native tools to manipulate the container storag=
e on the image.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>Thanks.</div>
<div>Jorge</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9094): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9094" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9094</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110655785/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110655785/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000006e84e1062bdeb077--

