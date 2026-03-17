Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEE8FED9EF
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:36:32 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81904.1773768989369124424
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 10:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNkBvWeH;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so1799537a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773768989; cv=none;
        d=google.com; s=arc-20240605;
        b=gEccIciyuEGyZquZBOxKo/zDVJAmTrf9zq9zWr2mNDLxf4T1vDEpwqwFhyOup81M/c
         lfC9z78qzOYYI0Oep7k4RtB1dADJtXHDmugYnBiLFS0xrBYPuPd1ZxhmhBFEMUKuH/0M
         e1TTBKQmdy+ZnU2bv+rOJgbU210erovBZrwrc0odtjd2iKQ1NyVXzlH/k2dLcGXQUSFJ
         49OhLOPQTdDzQgCOKWM5yGol/WCqBg6k/llK2XQG8L9AuC1+HQ8r6RW77GvlyMeg+KF0
         237/c/+1zjG0MacEB8KF8Nre5d7o0X23GBZzgE5z/QJ1nsrZeK0aJnbPeUrBFPTfuRxB
         kssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W7N2BkVa0TIzk7vTDYaVLkgO3uc7IWVVx4bKKotRvaM=;
        fh=wRmRZizxosSpGG2vAmvCnOIYGvKvfWRHnS92lRjBF2U=;
        b=euvDrwTolKXB0v7VDXYxBjmhjTaVOPl7MeGvb7BsPiaXX9lnqun8GF1xnclH0VXrjT
         0mVnbBLIQA2w5e8xN3pC0mq2ZrVeVaiT9sKhgQSQDIIi/jC21AFux0nMKYMCGO/Fxknr
         XxHlL0469WGKPzVN9XkC2inDScafpvpQErAmUUPQdKRcOiME4z1zduHAWOgEXQDGwdfh
         EGDr7zUDFyU14OXMQ5ZbYFIC8HBZfjuf/ukFlKaTbAMtF4HGhyK9Y8CfKYZxw7PARb93
         ob4LL+k75al4Ap1JXAht42tEyk1P6E8jRAX6yPmExo3pJiWcoNJVosn8EKC07Zv9YvwC
         cVrA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768989; x=1774373789; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W7N2BkVa0TIzk7vTDYaVLkgO3uc7IWVVx4bKKotRvaM=;
        b=JNkBvWeHEylGT/lbVQzDB5nqap+ytH2UIRBIBzXYrbfKxb1RcqmV42nYxzHSLBqmWA
         R8wfhfpFGw7Tyd3rVHGPMemNiHMV/pbHClsSSSFZUILO0NWHiVKu3zJWZfVT7ip0J7DQ
         Gm5SVjHatbQTAkww5TP2lJPzk0LjgmFWSKZHGxbuB+YXYT1ZpGTLdQ4KCg+Lc7LnMxfz
         jxLpOJuOsDhle44J/eFjb6Mb5pvFgqz3lteCgJjIcuYJoiCwf3+z1NxwKxLSkNvc2qpf
         GcuYWDZAisrPBRQ3CCREbgMPdTW+Ue080XnwGrTSLI4+HePqMVbJJy75VQCEgH6cI+1d
         IAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768989; x=1774373789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7N2BkVa0TIzk7vTDYaVLkgO3uc7IWVVx4bKKotRvaM=;
        b=CBm3k30KiLoSfQFdfKNb9agetg+B8E60KrWz3Qo0fLBYGdeMiepp9/Hl7HrsqJsoCJ
         u4TbBD6CCqVes5yNpFuhK5q4elbgBYCb47FCEUbWoE5s1yQy2BqNJZ4dz5OJLTSN/l1C
         TC77PNT1I72qxh+4+VApFKe/CHJc+ri3ewIWz3lI2ABFjiJkezoWGti45jN8egBx3xEJ
         1i3wHH+sd7s/Wm0KhwvbMSNvfQxvp4rvvhKBJb+dvaDTfwa1YLz8zWcHj9OfbMFrDx4H
         lzJW/b/O0SdtGiHZuPxyb9N0m28uPUoAG4/V/AoQjCl/aUNjR6xhL5H3cAX5BT2U/N07
         wTVg==
X-Forwarded-Encrypted: i=1; AJvYcCVR9Wx1mvWZ/yis4DOUvgos6Qglb7g7WIFmZabq3rmJm+QnuHeidAOWAiNl9pQUdCMgADox+mxodXdGQcDWWkh7zLdy@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwUY7PDGlhgH4k521BqtC80e9AuFIlngyXtiyZ1W9n/2nHA3eW3
	EUn+CzuMI3rTHFz8f2HjDYZfaw+2bnzdLLNlxmLzIU455WUMvsXvPuMWMAKoRNtJSMSKLl1fyly
	SxBFgTuQLLPTGMxxkIZ+opHu07O5x8DU=
X-Gm-Gg: ATEYQzzloup8iaSNgqBA/WoDuyut7dqZ5o8Y/DIwt9VdFOIO7uWy7E0wfFV0cpilNdx
	ntFH3+Oq612W0qOSGpwDrMHHyuav89pyfBO/Z34pBfnndp9fHF8Nurx5wt5GKyq5Wvyy02CRQPj
	Bmy5hHcy519Z78kkB/qR0GxAHyro7kUl0ompk0cuAaPULFdStxz4GufhhikXgUtmtvojy0ig7bC
	Og1SQfUmXJlYcuFd+P6WqMxybuDZfxfgd69lpqWvKecwi0gOZR6uFg4QdwxtQTNBCcY6lFdHyiV
	QtR/T6kQ7qkVZnHlF2WPqr8Wz8v0kN95Q6Wdr8Wy
X-Received: by 2002:a17:90b:5350:b0:353:5595:3247 with SMTP id
 98e67ed59e1d1-35bb9e5608cmr284902a91.12.1773768988435; Tue, 17 Mar 2026
 10:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <586528399.23310.1773677692552@app.mailbox.org>
 <1942784541.31638.1773686536467@app.mailbox.org> <CADkTA4NqcFRuOHu5d96T+mhOQTrR5aQv9BCHi2iBpdKq2dgGCQ@mail.gmail.com>
 <619668679.58252.1773740427017@app.mailbox.org>
In-Reply-To: <619668679.58252.1773740427017@app.mailbox.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Mar 2026 13:36:17 -0400
X-Gm-Features: AaiRm52DFVteFFGXj9ZkpHSg7BOteBj-jyftaeFDuQDVmQ0KGuWrrXBGz3Ql1E0
Message-ID: <CADkTA4Nid=+tns8f9w0ooX8CY=-OOB5e2JBuX2nGdX1xqdR8Tg@mail.gmail.com>
Subject: Re: [meta-virtualization] possible regression with: image-oci-unmoci:
 preserve file modes
To: patrick.vogelaar.dev@mailbox.org
Cc: "Bruce Ashfield via lists.yoctoproject.org" <bruce.ashfield=gmail.com@lists.yoctoproject.org>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000007827a1064d3bc64c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Mar 2026 17:36:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9666

--0000000000007827a1064d3bc64c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 5:40=E2=80=AFAM <patrick.vogelaar.dev@mailbox.org> =
wrote:

>
> > Bruce Ashfield via lists.yoctoproject.org <bruce.ashfield=3D
> gmail.com@lists.yoctoproject.org> hat am 16.03.2026 21:21 CET geschrieben=
:
> >
> >
> >
> >
> >
> > On Mon, Mar 16, 2026 at 2:42=E2=80=AFPM Patrick Vogelaar via
> lists.yoctoproject.org (http://lists.yoctoproject.org) <
> patrick.vogelaar.dev (http://patrick.vogelaar.dev)=3D
> mailbox.org@lists.yoctoproject.org> wrote:
> > > Hi all,
> > >
> > >  [0] caused a regression on my site. I am installing a recipe into th=
e
> container that sets ACLs with setfacl in pkg_postinst. To my understandin=
g
> those xattr were not preserved before anyways so wouldn't it be better to
> change it to:
> > >
> > Hmm. The -a has been around for over a year in master, so we need to
> > dig into this more.
> >
> > My recollection and quick check is that -a should be copying the xattrs
> > from our source to the umoci layer structure.
> >
> > The bbclass operates on the fully assembled image, so anything you've
> > put in place for ACLs, etc, should be preserved.
> >
> > Rather than dropping -a, I'd extend it with --preserve=3Dxattr if we ar=
e
> missing
> > something in a binutils -> filesystem -> or something else combination.
> >
> > If you had specific examples, I could comment further.
> >
> That is what is done in the recipe:
>
> pkg_postinst:${PN}() {
>     chmod 040 $D${sysconfdir}/example.conf
>     setfacl -m g:example-users:r $D${sysconfdir}/example.conf
> }
>
> and this is the error I am getting:
>
> cp: preserving permissions for '<path>/example.conf': Invalid argument
>
> I dug a bit deeper and I was wrong that it is related to the ACLs, the 04=
0
> mode is the problem.
>
> My best guess so far is that do_image_oci runs under pseudo but
> ${WORKDIR}/deploy- is added in PSEUDO_IGNORE_PATHS. Since IMGDEPLOYDIR is
> ${WORKDIR}/deploy-${PN}-image-complete, the entire umoci bundle directory
> is outside pseudo coverage.
>
> This means cp -r -a in do_image_oci:
> * read: the source rootfs through pseudo (works fine, pseudo fakes root
> ownership)
> * write: to the deploy dir without pseudo (runs as the real unprivileged
> build user)
>
>
Anything is possible, but that shouldn't be the case.

 All do_image_* tasks (including do_image_oci) are automatically marked
 fakeroot by image.bbclass during the image type setup loop.

So the cp -a, rsync, and find operations in IMAGE_CMD:oci all run
under pseudo, which means file ownership, permissions, device nodes,
and special files are  racked correctly through the copy into the umoci
staging area.

Here's what I think (and I'm almost sure), is happening

Those ACLs were never copying over reliably, or at least by the design of
the
system (and I don't mean meta-virt, I mean OE and pseudo) they shouldn't
have been.

a) setfacl in the postinst runs during do_rootfs (also under pseudo). It
calls
setxattr() for system.posix_acl_access. Depending on the underlying tmp/
filesystem, the ACL may get written to the real filesystem bypassing
pseudo's database (pseudo doesn't intercept  system.* xattrs consistently)

But maybe it is that your tmp/ is holding them as it is the right filesyste=
m
(I'm guessing there).

b) During do_image_oci, cp -a (--preserve=3Dall) reads the source file, see=
s
it has a POSIX ACL (from the real filesystem), and tries to
setxattr(system.posix_acl_access) on the destination. Pseudo intercepts
that call and returns EINVAL because it doesn't know how to handle it.

BUT, here's the kicker. The ACLs wouldn't survive umoci repack into the
OCI tar layer anyway =E2=80=94 umoci uses Go's archive/tar which doesn't
preserve POSIX ACLs.  You'll see that in the mult-layer OCI image work
in master.

Before this patch, cp -r didn't try to preserve xattrs/ACLs at all, so the
possibly broken setfacl under pseudo was silently ignored.  Now with
 -a, cp attempts to read and replicate the ACL xattrs, hits pseudo's
EINVAL on setxattr(system.posix_acl_access), and fails visibly.

My best suggestion is that something needs to be done on the target
at runtime when the container starts (e.g., in an entrypoint script or
a systemd unit), not in a build-time postinst. That's the only path I can
think of where ACLs will actually be effective on the running filesystem.

Bruce



> This means that cp -a tries to preserve mode 040 and the unprivileged
> build user cannot remove their own read permission on files they own.
>
> Does this make sense? I am not too familiar with the permissions handling=
.
>
> Patrick
>
> >
> > Bruce
> >
> >
> >
> > > cp -r --preserve=3Dmode,timestamps,links ${IMAGE_ROOTFS}/*
> $image_bundle_name/rootfs
> > >
> > >  Could also be that I am doing something wrong in my recipe when
> setting the ACLs.
> > >
> > >  [0]
> https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dscarthgap
> > >
> > >  Best Regards
> > >  Patrick
> > >
> > >
> > >
> > >
> >
> >
> > --
> >
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9664):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9664
> > Mute This Topic: https://lists.yoctoproject.org/mt/118351110/10013339
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [patrick.vogelaar.dev@mailbox.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007827a1064d3bc64c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2026 at 5:40=E2=80=AFAM &lt;=
<a href=3D"mailto:patrick.vogelaar.dev@mailbox.org" target=3D"_blank">patri=
ck.vogelaar.dev@mailbox.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
&gt; Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org" rel=3D"no=
referrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;bruce.ashfield=
=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gm=
ail.com@lists.yoctoproject.org</a>&gt; hat am 16.03.2026 21:21 CET geschrie=
ben:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Mar 16, 2026 at 2:42=E2=80=AFPM Patrick Vogelaar via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a> (<a href=3D"http://lists.yoctoproject.org" rel=3D"n=
oreferrer" target=3D"_blank">http://lists.yoctoproject.org</a>) &lt;<a href=
=3D"http://patrick.vogelaar.dev" rel=3D"noreferrer" target=3D"_blank">patri=
ck.vogelaar.dev</a> (<a href=3D"http://patrick.vogelaar.dev" rel=3D"norefer=
rer" target=3D"_blank">http://patrick.vogelaar.dev</a>)=3D<a href=3D"mailto=
:mailbox.org@lists.yoctoproject.org" target=3D"_blank">mailbox.org@lists.yo=
ctoproject.org</a>&gt; wrote:<br>
&gt; &gt; Hi all,<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 [0] caused a regression on my site. I am installing a recip=
e into the container that sets ACLs with setfacl in pkg_postinst. To my und=
erstanding those xattr were not preserved before anyways so wouldn&#39;t it=
 be better to change it to:<br>
&gt; &gt;=C2=A0 <br>
&gt; Hmm. The -a has been around for over a year in master, so we need to<b=
r>
&gt; dig into this more.<br>
&gt; <br>
&gt; My recollection and quick check is that -a should be copying the xattr=
s<br>
&gt; from our source to the umoci layer structure.<br>
&gt; <br>
&gt; The bbclass operates on the fully assembled image, so anything you&#39=
;ve<br>
&gt; put in place for ACLs, etc, should be preserved.<br>
&gt; <br>
&gt; Rather than dropping -a, I&#39;d extend it with=C2=A0--preserve=3Dxatt=
r if we are missing<br>
&gt; something in a binutils -&gt; filesystem -&gt; or something else combi=
nation.<br>
&gt; <br>
&gt; If you had specific examples, I could comment further.<br>
&gt; <br>
That is what is done in the recipe:<br>
<br>
pkg_postinst:${PN}() {<br>
=C2=A0 =C2=A0 chmod 040 $D${sysconfdir}/example.conf<br>
=C2=A0 =C2=A0 setfacl -m g:example-users:r $D${sysconfdir}/example.conf<br>
}<br>
<br>
and this is the error I am getting:<br>
<br>
cp: preserving permissions for &#39;&lt;path&gt;/example.conf&#39;: Invalid=
 argument<br>
<br>
I dug a bit deeper and I was wrong that it is related to the ACLs, the 040 =
mode is the problem.<br>
<br>
My best guess so far is that do_image_oci runs under pseudo but ${WORKDIR}/=
deploy- is added in PSEUDO_IGNORE_PATHS. Since IMGDEPLOYDIR is ${WORKDIR}/d=
eploy-${PN}-image-complete, the entire umoci bundle directory is outside ps=
eudo coverage.<br>
<br>
This means cp -r -a in do_image_oci:<br>
* read: the source rootfs through pseudo (works fine, pseudo fakes root own=
ership)<br>
* write: to the deploy dir without pseudo (runs as the real unprivileged bu=
ild user)<br>
<br></blockquote><div><br><div class=3D"gmail_default" style=3D"font-size:s=
mall">Anything is possible, but that shouldn&#39;t be the case.=C2=A0</div>=
<br>=C2=A0All do_image_* tasks <span class=3D"gmail_default" style=3D"font-=
size:small">(i</span>ncluding do_image_oci<span class=3D"gmail_default" sty=
le=3D"font-size:small">)</span>=C2=A0are automatically marked</div><div>=C2=
=A0fakeroot by<span class=3D"gmail_default" style=3D"font-size:small"></spa=
n>=C2=A0image.bbclass during the image type setup loop.=C2=A0</div><div><br=
></div><div>So the cp -a, rsync, and find operations in IMAGE_CMD:oci all r=
un</div><div>under pseudo,<span class=3D"gmail_default" style=3D"font-size:=
small">=C2=A0</span>which means file ownership, permissions, device<span cl=
ass=3D"gmail_default">=C2=A0</span>nodes,</div><div>and special files are <=
span class=3D"gmail_default" style=3D"font-size:small">=C2=A0</span>racked =
correctly through the copy into the umoci=C2=A0</div><div>staging area.</di=
v><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">Here&#39;s what I think (and I&#39;m almost sure), is happening<br><br>Th=
ose ACLs were never copying over reliably, or at least by the design of the=
</div><div class=3D"gmail_default" style=3D"font-size:small">system (and I =
don&#39;t mean meta-virt, I mean OE and pseudo) they shouldn&#39;t</div><di=
v class=3D"gmail_default" style=3D"font-size:small">have been.<br><br>a) se=
tfacl in the postinst runs during do_rootfs (also under pseudo). It calls</=
div><div class=3D"gmail_default" style=3D"font-size:small">setxattr() for s=
ystem.posix_acl_access. Depending on the underlying tmp/=C2=A0</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">filesystem, the ACL may get=
 written to the real filesystem bypassing</div><div class=3D"gmail_default"=
 style=3D"font-size:small">pseudo&#39;s database (pseudo doesn&#39;t interc=
ept=C2=A0 system.* xattrs consistently)</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">But maybe it is that your tmp/ is holding them as it is the =
right filesystem</div><div class=3D"gmail_default" style=3D"font-size:small=
">(I&#39;m guessing there).<br></div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">b) During do_image_oci, cp -a (--preserve=3Dall) reads the source fi=
le, sees</div><div class=3D"gmail_default" style=3D"font-size:small">it has=
 a POSIX ACL (from the real filesystem), and tries to</div><div class=3D"gm=
ail_default" style=3D"font-size:small">setxattr(system.posix_acl_access) on=
 the destination. Pseudo intercepts</div><div class=3D"gmail_default" style=
=3D"font-size:small">that call and returns EINVAL because it doesn&#39;t kn=
ow how=C2=A0to handle it.<br><br>BUT, here&#39;s the kicker. The ACLs would=
n&#39;t survive umoci repack into the</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">OCI tar layer anyway =E2=80=94 umoci uses Go&#39;s a=
rchive/tar which doesn&#39;t</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">preserve POSIX ACLs.=C2=A0 You&#39;ll see that in the mult-la=
yer OCI image work</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">in master.<br><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Before this patch, cp -r didn&#39;t try to preserve xattrs/ACLs at =
all, so the</div><div class=3D"gmail_default" style=3D"font-size:small">pos=
sibly broken setfacl under pseudo was silently ignored.=C2=A0=C2=A0Now with=
</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0-a, cp a=
ttempts to read and replicate the ACL xattrs, hits pseudo&#39;s</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">EINVAL on setxattr(system.=
posix_acl_access), and fails visibly.<br><br>My best suggestion is that som=
ething needs to be done on the target</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">at runtime when the container starts (e.g., in an en=
trypoint script or</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">a systemd unit), not in a build-time postinst. That&#39;s the only path=
 I can</div><div class=3D"gmail_default" style=3D"font-size:small">think of=
 where ACLs will actually be effective on the running filesystem.<br><br>Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
This means that cp -a tries to preserve mode 040 and the unprivileged build=
 user cannot remove their own read permission on files they own.<br>
<br>
Does this make sense? I am not too familiar with the permissions handling.<=
br>
<br>
Patrick<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; cp -r --preserve=3Dmode,timestamps,links ${IMAGE_ROOTFS}/* $image=
_bundle_name/rootfs<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 Could also be that I am doing something wrong in my recipe =
when setting the ACLs. <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 [0] <a href=3D"https://git.yoctoproject.org/meta-virtualiza=
tion/commit/?h=3Dscarthgap" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.yoctoproject.org/meta-virtualization/commit/?h=3Dscarthgap</a><br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 Best Regards<br>
&gt; &gt;=C2=A0 Patrick<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9664): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9664" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9664</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11835111=
0/10013339" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject=
.org/mt/118351110/10013339</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:patrick.vogelaar.=
dev@mailbox.org" target=3D"_blank">patrick.vogelaar.dev@mailbox.org</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>

--0000000000007827a1064d3bc64c--

