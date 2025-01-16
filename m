Return-Path: <jcorichiherrejon@sgl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180D9C02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 21:33:05 +0000 (UTC)
Subject: OCI image .tar installation
To: meta-virtualization@lists.yoctoproject.org
From: "Jorge C." <jcorichiherrejon@sgl.com>
X-Originating-Location: Wakefield, Quebec, CA (209.87.231.80)
X-Originating-Platform: Windows Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 13:32:59 -0800
Message-ID: <37Va.1737063179298829181.RVW3@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="tbEuQ7ggmDYD3KsLuo7y"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jan 2025 21:33:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9094

--tbEuQ7ggmDYD3KsLuo7y
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm looking to install a .tar file that contains a container image into the=
 rootfs; this .tar being a product of a podman pull/podman save commands.
I've been going through the threads in the mailing list and watched some of=
 the talks and demos about this but have not been able to figure it out and=
 I was hoping I could find some guidance here.

So far, I've created a recipe that attempts to:
1. `podman pull` a group of images I have declared in a manifest.
2. `podman save` the images to produce the .tar.
3.=C2=A0 Install the .tar along with a docker-compose.yml; on boot a servic=
e loads the containers from the .tar.

The problem is that podman is not found and the tasks fail.
I've been following the meta-embedded-containers repo ( https://github.com/=
savoirfairelinux/meta-embedded-containers/tree/main ) , but I would like to=
 avoid passing podman through HOSTTOOLS.

As I understand, using docker is not an option because it's not a native pa=
ckage, which is why I'm leaning for podman.
Does someone know of another approach for copying the OCI image onto the di=
rectory?

Thanks.
Jorge

--tbEuQ7ggmDYD3KsLuo7y
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>I'm looking to install a .tar file that contains a container image int=
o the rootfs; this .tar being a product of a podman pull/podman save comman=
ds.&nbsp;</div>
<div>I've been going through the threads in the mailing list and watched so=
me of the talks and demos about this but have not been able to figure it ou=
t and I was hoping I could find some guidance here.</div>
<div>&nbsp;</div>
<div>So far, I've created a recipe that attempts to:</div>
<div>1. `podman pull` a group of images I have declared in a manifest.</div=
>
<div>2. `podman save` the images to produce the .tar.</div>
<div>3.&nbsp; Install the .tar along with a docker-compose.yml; on boot a s=
ervice loads the containers from the .tar.</div>
<div>&nbsp;</div>
<div>The problem is that podman is not found and the tasks fail.</div>
<div>I've been following the <a href=3D"https://github.com/savoirfairelinux=
/meta-embedded-containers/tree/main" target=3D"_blank" rel=3D"noopener">met=
a-embedded-containers repo</a>, but I would like to avoid passing podman th=
rough HOSTTOOLS.</div>
<div>&nbsp;</div>
<div>As I understand, using docker is not an option because it's not a nati=
ve package, which is why I'm leaning for podman.</div>
<div>Does someone know of another approach for copying the OCI image onto t=
he directory?</div>
<div>&nbsp;</div>
<div>Thanks.</div>
<div>Jorge</div>
<div>&nbsp;</div>

--tbEuQ7ggmDYD3KsLuo7y--

