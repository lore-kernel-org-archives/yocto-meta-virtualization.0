Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E0EF3382C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:40:36 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72100.1773740434595865276
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 02:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=PDidKDIi;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fZn4t0fKGz9thn;
	Tue, 17 Mar 2026 10:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773740430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmFGKJlxrRLUdkGEeMOFz8De5+51ezf/bTtyYUwqycQ=;
	b=PDidKDIi/q96r0VmMw2cLlHCXxKf2krpIim/ABwx6cYL5NDLDYUZBKZRiq0eH7MxSMpdHg
	yhbGwcHPcDIr1U/7v/6EZQW0usy+kCWtjcRtwHZ/ijiTZGBQq+QLZ9wZujXTcNszD8MrnC
	GSlt65vgioL/OyxMb6p34TmJzYuXyt4RuW71fQP14oeQmbCVR6yBUvp96gWVFnReJ1q266
	6BEyLThd3pOyJkQtwc3SzhIgHy4gp0SgBlvMVjw1CBuKZzKKqtfo9b5a/xA0/ydWtVybiX
	Ni1m/vahR/urwPcNrQ1zwqrUV2aF1NGIHeYqS2tKApkbYKDlMQv33MgYSZ5p3A==
Date: Tue, 17 Mar 2026 10:40:26 +0100 (CET)
From: patrick.vogelaar.dev@mailbox.org
To: bruce.ashfield@gmail.com, "Bruce Ashfield via lists.yoctoproject.org"
 <bruce.ashfield=gmail.com@lists.yoctoproject.org>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Message-ID: <619668679.58252.1773740427017@app.mailbox.org>
In-Reply-To: <CADkTA4NqcFRuOHu5d96T+mhOQTrR5aQv9BCHi2iBpdKq2dgGCQ@mail.gmail.com>
References: <586528399.23310.1773677692552@app.mailbox.org>
 <1942784541.31638.1773686536467@app.mailbox.org>
 <CADkTA4NqcFRuOHu5d96T+mhOQTrR5aQv9BCHi2iBpdKq2dgGCQ@mail.gmail.com>
Subject: Re: [meta-virtualization] possible regression with:
 image-oci-unmoci: preserve file modes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: 75553908486f328d2e6
X-MBO-RS-META: h3ct6jarwp1kaz3dng187o7wrm743f7x
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Mar 2026 09:40:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9665


> Bruce Ashfield via lists.yoctoproject.org <bruce.ashfield=3Dgmail.com@lis=
ts.yoctoproject.org> hat am 16.03.2026 21:21 CET geschrieben:
>=20
>=20
>=20
>=20
>=20
> On Mon, Mar 16, 2026 at 2:42=E2=80=AFPM Patrick Vogelaar via lists.yoctop=
roject.org (http://lists.yoctoproject.org) <patrick.vogelaar.dev (http://pa=
trick.vogelaar.dev)=3Dmailbox.org@lists.yoctoproject.org> wrote:
> > Hi all,
> > =20
> >  [0] caused a regression on my site. I am installing a recipe into the =
container that sets ACLs with setfacl in pkg_postinst. To my understanding =
those xattr were not preserved before anyways so wouldn't it be better to c=
hange it to:
> > =20
> Hmm. The -a has been around for over a year in master, so we need to
> dig into this more.
>=20
> My recollection and quick check is that -a should be copying the xattrs
> from our source to the umoci layer structure.
>=20
> The bbclass operates on the fully assembled image, so anything you've
> put in place for ACLs, etc, should be preserved.
>=20
> Rather than dropping -a, I'd extend it with=C2=A0--preserve=3Dxattr if we=
 are missing
> something in a binutils -> filesystem -> or something else combination.
>=20
> If you had specific examples, I could comment further.
>=20
That is what is done in the recipe:

pkg_postinst:${PN}() {
    chmod 040 $D${sysconfdir}/example.conf
    setfacl -m g:example-users:r $D${sysconfdir}/example.conf
}

and this is the error I am getting:

cp: preserving permissions for '<path>/example.conf': Invalid argument

I dug a bit deeper and I was wrong that it is related to the ACLs, the 040 =
mode is the problem.

My best guess so far is that do_image_oci runs under pseudo but ${WORKDIR}/=
deploy- is added in PSEUDO_IGNORE_PATHS. Since IMGDEPLOYDIR is ${WORKDIR}/d=
eploy-${PN}-image-complete, the entire umoci bundle directory is outside ps=
eudo coverage.

This means cp -r -a in do_image_oci:
* read: the source rootfs through pseudo (works fine, pseudo fakes root own=
ership)
* write: to the deploy dir without pseudo (runs as the real unprivileged bu=
ild user)

This means that cp -a tries to preserve mode 040 and the unprivileged build=
 user cannot remove their own read permission on files they own.

Does this make sense? I am not too familiar with the permissions handling.

Patrick

>=20
> Bruce
>=20
>=20
>=20
> > cp -r --preserve=3Dmode,timestamps,links ${IMAGE_ROOTFS}/* $image_bundl=
e_name/rootfs
> > =20
> >  Could also be that I am doing something wrong in my recipe when settin=
g the ACLs.=20
> > =20
> >  [0] https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dscart=
hgap
> > =20
> >  Best Regards
> >  Patrick
> > =20
> > =20
> > =20
> >=20
>=20
>=20
> --
>=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9664): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9664
> Mute This Topic: https://lists.yoctoproject.org/mt/118351110/10013339
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
patrick.vogelaar.dev@mailbox.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

