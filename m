Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063BEC636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 18:08:10 +0000 (UTC)
Subject: Re: query on container demo
To: meta-virtualization@lists.yoctoproject.org
From: "SIMON BABY" <simonkbaby@gmail.com>
X-Originating-Location: San Diego, California, US (130.50.200.1)
X-Originating-Platform: Windows Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Feb 2023 10:08:02 -0800
References: <21754.1676335870049801294@lists.yoctoproject.org>
In-Reply-To: <21754.1676335870049801294@lists.yoctoproject.org>
Message-ID: <20503.1676484482559550816@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="8brZMaSJwepUdonXhfTc"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 18:08:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7855

--8brZMaSJwepUdonXhfTc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 04:51 PM, SIMON BABY wrote:

>=20
>=20
>=20
> *docker: Error response from daemon: failed to create shim task: OCI
> runtime create failed: runc create failed: unable to start container
> process: can't get final child's PID from pipe: EOF: unknown.*
>=20
>=20
>=20
> ERRO[0000] error waiting for container: context canceled
>=20
>=20

Hello team,
May i know the reason for the below error while trying to run the oci image=
 from docker command.

docker: Error response from daemon: failed to create shim task: OCI runtime=
 create failed: runc create failed: unable to start container process: can'=
t get final child's PID from pipe: EOF: unknown.

ERRO[0000] error waiting for container: context canceled

Regards
Simon

--8brZMaSJwepUdonXhfTc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 04:51 PM, SIMON BABY wrote:<br />
<blockquote>
<p class=3D"DefangedMsoNormal"><strong><span style=3D"color: red;">docker: =
Error response from daemon: failed to create shim task: OCI runtime create =
failed: runc create failed: unable to start container process: can't get fi=
nal child's PID from pipe: EOF: unknown.</span></strong></p>
<p class=3D"DefangedMsoNormal">ERRO[0000] error waiting for container: cont=
ext canceled</p>
</blockquote>
Hello team,<br />&nbsp;May i know the reason for the below error while tryi=
ng to run the oci image from docker command.<br /><br />
<p class=3D"DefangedMsoNormal" style=3D"line-height: 1.42857;"><span style=
=3D"font-weight: bold;"><span style=3D"color: red;">docker: Error response =
from daemon: failed to create shim task: OCI runtime create failed: runc cr=
eate failed: unable to start container process: can't get final child's PID=
 from pipe: EOF: unknown.</span></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0px; line-height: 1.=
42857;">ERRO[0000] error waiting for container: context canceled<br /><br /=
>Regards<br />Simon</p>

--8brZMaSJwepUdonXhfTc--

