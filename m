Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC3FC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 05:55:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.155020.1692165307244800733
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 22:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P3imx87h;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3196afc7d4bso3182858f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Aug 2023 22:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692165305; x=1692770105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FwYTb18usWWv3MvUxIBV6Ey3YeFpefV0Txi3cRBtVVM=;
        b=P3imx87h09k3o++w08oT0Z0YK0EkKpvR9Pbqfa0ejHS29Xrvt76vV5KWB4lUaxKXyQ
         cLKtA7Hk2lNgCpgx8PZrrKmmyaCWkpalZaxkX/dQ6/bGnwn4IKEGVIPHjedNNwSRaw5x
         zFji1MCr74/grIzRDDWdOoptG8UhPCY+jXqV+nPC+hhLXRN98xfNo5UnUi8g0CYw1IHb
         f/2+zHvzmAPrQz8PpL/FXY/bMhB8pe/vSuI+8vy4jii8Zusr9e/zKjNTuuZzP6Mt9gWD
         3EsqKidSpMJS/j1JXNRmeNORYlzvMNGXsVrzBSFmGV7opVjmpHFRScjLbOiYoupgAY2h
         U0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692165305; x=1692770105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwYTb18usWWv3MvUxIBV6Ey3YeFpefV0Txi3cRBtVVM=;
        b=VAHyK8n7I1s9FRXPTTK9YNpm55xe8lyDVVirD4OfuHocaS2YDxKwGdRYXxewjlf66h
         8HiVS4RjV4TKGfu9TnPAdGszR6uTOub6qtsCXU2aoJSTHMMgWCnv1iCqAUQumT1wt6df
         c3emilQ4tN0Rsid2KR7l0hpDUhDfi0EB8xgBLnEu/Ar7wO4DtuimZEJBsUkiIlHIcdVB
         28DZ++H4O1RFh3rPX5BAUi7mkiHQVeaQdEm7QnCvp/nAFNZ1tijs5cTv8nrOJuJ1zS5p
         H2iM+y/gBC8Q66dhTn1qrs6TCiYQBokZPbTxVFfiTdYCvLLiV2Q1nEpwTFfCYo00tLmB
         ACbQ==
X-Gm-Message-State: AOJu0YzQ117r/GsdHCm670wkm4aWLmm0VLjHzGzOpWpCsk2WX5vfLkcm
	e0d6VVFakQQvxlOt7MeRI6BOIZjRYJjgJOE4GZI=
X-Google-Smtp-Source: AGHT+IFmRg+Wf8f/40YdAAQw6OqfBaONVBRkccuQUik+mGH7PAfcSg/y6nyD+0Squ0HWLdRA5xnyxSUdr1chETJi624=
X-Received: by 2002:a5d:4529:0:b0:317:5d3d:d387 with SMTP id
 j9-20020a5d4529000000b003175d3dd387mr852303wra.25.1692165305315; Tue, 15 Aug
 2023 22:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230814151356.1001953-1-Martin.Jansa@gmail.com>
 <177B48E707B1FD85.12117@lists.yoctoproject.org> <CA+chaQei9w4MDNhZPojhKXf=Tx-DTt2PE0UapJ3eis5eciTnDw@mail.gmail.com>
 <CA+chaQcKaxcvOF6Y6p8D-B80NwCEqZVuh6QvpA-9Rm=TUiFTMQ@mail.gmail.com>
 <BL1PR11MB600117F27F20E29B53648DEEAD14A@BL1PR11MB6001.namprd11.prod.outlook.com>
 <CA+chaQcuBONPMTDZMvtow23T_ZeoeKuqotHXXOV=muj1Hifa+w@mail.gmail.com> <CADkTA4P9Ge+uzpdgAjmy2r0obAwE-hCq8F5_OBObAoVWCQHkew@mail.gmail.com>
In-Reply-To: <CADkTA4P9Ge+uzpdgAjmy2r0obAwE-hCq8F5_OBObAoVWCQHkew@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Aug 2023 07:54:47 +0200
Message-ID: <CA+chaQc22iEWXWLR8Zjpi1tSS8ijuW7rmRQbRt+KLVrsECKYqw@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker: update to
 v20.10.25 + 58 commits to fix compatibility with go currently in kirkstone
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: fib@cisco.com, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ecb57f060303ef54"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 05:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8195

--000000000000ecb57f060303ef54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue is that in last version I've somehow missed the
SRCREV_docker =3D "3056208812eb5e792fa99736c9167d1e10f4ab49"
update in docker-ce.

Will send the fix shortly.

On Wed, Aug 16, 2023 at 6:04=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Tue, Aug 15, 2023 at 5:14=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.=
com>
> wrote:
> >
> > Hmm, I was testing docker-moby, not docker-ce, but I don't see why it
> would be happening. Will try docker-ce tomorrow.
> >
>
> docker-ce carries some patches for integration with downstream layers
> that have some patches for extended functionality required for
> container OS namespace manipulations.
>
> I merged the patch without testing it against -ce myself, so I
> wouldn't worry about spending too much time on it, I can do the
> refreshes.
>
> Bruce
>
> > On Tue, Aug 15, 2023 at 11:06=E2=80=AFPM Ruslan Babayev (fib) via
> lists.yoctoproject.org <fib=3Dcisco.com@lists.yoctoproject.org> wrote:
> >>
> >> Hi Martin,
> >>
> >>
> >>
> >> Build fails with:
> >>
> >>
> >>
> >> ERROR:
> docker-ce-20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0
> do_patch: Applying patch
> '0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch' on target directory
> '<REDACTED>/tmp/work/core2-64-poky-linux/docker-ce/20.10.25-ce+git3056208=
812eb5e792fa99736c9167d1e10f4ab49-r0/git/src/import'
> >>
> >> CmdError('quilt --quiltrc
> <REDACTED>/tmp/work/core2-64-poky-linux/docker-ce/20.10.25-ce+git30562088=
12eb5e792fa99736c9167d1e10f4ab49-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch
> 0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch
> >>
> >> patching file Dockerfile
> >>
> >> Hunk #1 FAILED at 3.
> >>
> >> Hunk #2 FAILED at 267.
> >>
> >> Hunk #3 FAILED at 316.
> >>
> >> 3 out of 3 hunks FAILED -- rejects in file Dockerfile
> >>
> >> patching file Dockerfile.e2e
> >>
> >> Hunk #1 FAILED at 1.
> >>
> >> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.e2e
> >>
> >> patching file Dockerfile.simple
> >>
> >> Hunk #1 FAILED at 5.
> >>
> >> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.simple
> >>
> >> patching file Dockerfile.windows
> >>
> >> Hunk #1 FAILED at 165.
> >>
> >> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.windows
> >>
> >> patching file hack/dockerfile/install/gotestsum.installer
> >>
> >> Hunk #1 FAILED at 1.
> >>
> >> 1 out of 1 hunk FAILED -- rejects in file
> hack/dockerfile/install/gotestsum.installer
> >>
> >> Patch 0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch can be
> reverse-applied
> >>
> >>
> >>
> >> stderr: ')
> >>
> >> ERROR: Logfile of failure stored in:
> <REDACTED>/tmp/work/core2-64-poky-linux/docker-ce/20.10.25-ce+git30562088=
12eb5e792fa99736c9167d1e10f4ab49-r0/temp/log.do_patch.622820
> >>
> >> ERROR: Task
> <REDACTED>/meta-virtualization/recipes-containers/docker/docker-ce_git.bb=
:do_patch)
> failed with exit code '1'
> >>
> >>
> >>
> >>
> >>
> >> From: meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> On Behalf Of Martin Jansa
> >> Sent: Monday, August 14, 2023 12:03 PM
> >> To: Martin.Jansa@gmail.com
> >> Cc: meta-virtualization@lists.yoctoproject.org
> >> Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker:
> update to v20.10.25 + 58 commits to fix compatibility with go currently i=
n
> kirkstone
> >>
> >>
> >>
> >> On Mon, Aug 14, 2023 at 9:00=E2=80=AFPM Martin Jansa <martin.jansa@gma=
il.com>
> wrote:
> >>
> >>
> >>
> >>
> >>
> >> On Mon, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa via lists.yoctopr=
oject.org
> <Martin.Jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>
> >> RFC, because I've only build tested this in kirkstone, waiting for
> whole image to build to test it in runtime
> >>
> >>
> >>
> >> Passed minimal sanity check on rpi4-64:
> >>
> >>
> >>
> >> my fat fingers didn't pass copy&pasting test, here 2nd try:
> >>
> >>
> >>
> >> root@rpi4:~# systemctl start docker.service
> >> root@rpi4:~# docker run -it --rm ubuntu
> >> Unable to find image 'ubuntu:latest' locally
> >> latest: Pulling from library/ubuntu
> >> 5af00eab9784: Pull complete
> >> Digest:
> sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508
> >> Status: Downloaded newer image for ubuntu:latest
> >> root@92414c21da3d:/#
> >>
> >> root@92414c21da3d:/# cat /etc/lsb-release
> >> DISTRIB_ID=3DUbuntu
> >> DISTRIB_RELEASE=3D22.04
> >> DISTRIB_CODENAME=3Djammy
> >> DISTRIB_DESCRIPTION=3D"Ubuntu 22.04.2 LTS"
> >>
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8193):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8193
> > Mute This Topic: https://lists.yoctoproject.org/mt/100738603/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000ecb57f060303ef54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The issue is that in last version I&#39;ve somehow missed =
the<div>SRCREV_docker =3D &quot;3056208812eb5e792fa99736c9167d1e10f4ab49&qu=
ot;<br></div><div>update in docker-ce.</div><div><br></div><div>Will send t=
he fix shortly.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Aug 16, 2023 at 6:04=E2=80=AFAM Bruce Ashfield=
 &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Tue, Aug 15, 2023 at 5:14=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hmm, I was testing docker-moby, not docker-ce, but I don&#39;t see why=
 it would be happening. Will try docker-ce tomorrow.<br>
&gt;<br>
<br>
docker-ce carries some patches for integration with downstream layers<br>
that have some patches for extended functionality required for<br>
container OS namespace manipulations.<br>
<br>
I merged the patch without testing it against -ce myself, so I<br>
wouldn&#39;t worry about spending too much time on it, I can do the<br>
refreshes.<br>
<br>
Bruce<br>
<br>
&gt; On Tue, Aug 15, 2023 at 11:06=E2=80=AFPM Ruslan Babayev (fib) via <a h=
ref=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">=
lists.yoctoproject.org</a> &lt;fib=3D<a href=3D"mailto:cisco.com@lists.yoct=
oproject.org" target=3D"_blank">cisco.com@lists.yoctoproject.org</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Martin,<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Build fails with:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ERROR: docker-ce-20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10=
f4ab49-r0 do_patch: Applying patch &#39;0001-Revert-go-updates-from-1.19.12=
-to-1.18.7.patch&#39; on target directory &#39;&lt;REDACTED&gt;/tmp/work/co=
re2-64-poky-linux/docker-ce/20.10.25-ce+git3056208812eb5e792fa99736c9167d1e=
10f4ab49-r0/git/src/import&#39;<br>
&gt;&gt;<br>
&gt;&gt; CmdError(&#39;quilt --quiltrc &lt;REDACTED&gt;/tmp/work/core2-64-p=
oky-linux/docker-ce/20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49=
-r0/recipe-sysroot-native/etc/quiltrc push&#39;, 0, &#39;stdout: Applying p=
atch 0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch<br>
&gt;&gt;<br>
&gt;&gt; patching file Dockerfile<br>
&gt;&gt;<br>
&gt;&gt; Hunk #1 FAILED at 3.<br>
&gt;&gt;<br>
&gt;&gt; Hunk #2 FAILED at 267.<br>
&gt;&gt;<br>
&gt;&gt; Hunk #3 FAILED at 316.<br>
&gt;&gt;<br>
&gt;&gt; 3 out of 3 hunks FAILED -- rejects in file Dockerfile<br>
&gt;&gt;<br>
&gt;&gt; patching file Dockerfile.e2e<br>
&gt;&gt;<br>
&gt;&gt; Hunk #1 FAILED at 1.<br>
&gt;&gt;<br>
&gt;&gt; 1 out of 1 hunk FAILED -- rejects in file Dockerfile.e2e<br>
&gt;&gt;<br>
&gt;&gt; patching file Dockerfile.simple<br>
&gt;&gt;<br>
&gt;&gt; Hunk #1 FAILED at 5.<br>
&gt;&gt;<br>
&gt;&gt; 1 out of 1 hunk FAILED -- rejects in file Dockerfile.simple<br>
&gt;&gt;<br>
&gt;&gt; patching file Dockerfile.windows<br>
&gt;&gt;<br>
&gt;&gt; Hunk #1 FAILED at 165.<br>
&gt;&gt;<br>
&gt;&gt; 1 out of 1 hunk FAILED -- rejects in file Dockerfile.windows<br>
&gt;&gt;<br>
&gt;&gt; patching file hack/dockerfile/install/gotestsum.installer<br>
&gt;&gt;<br>
&gt;&gt; Hunk #1 FAILED at 1.<br>
&gt;&gt;<br>
&gt;&gt; 1 out of 1 hunk FAILED -- rejects in file hack/dockerfile/install/=
gotestsum.installer<br>
&gt;&gt;<br>
&gt;&gt; Patch 0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch can be r=
everse-applied<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; stderr: &#39;)<br>
&gt;&gt;<br>
&gt;&gt; ERROR: Logfile of failure stored in: &lt;REDACTED&gt;/tmp/work/cor=
e2-64-poky-linux/docker-ce/20.10.25-ce+git3056208812eb5e792fa99736c9167d1e1=
0f4ab49-r0/temp/log.do_patch.622820<br>
&gt;&gt;<br>
&gt;&gt; ERROR: Task &lt;REDACTED&gt;/meta-virtualization/recipes-container=
s/docker/docker-ce_git.bb:do_patch) failed with exit code &#39;1&#39;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; From: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org=
" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a h=
ref=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank"=
>meta-virtualization@lists.yoctoproject.org</a>&gt; On Behalf Of Martin Jan=
sa<br>
&gt;&gt; Sent: Monday, August 14, 2023 12:03 PM<br>
&gt;&gt; To: <a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Ma=
rtin.Jansa@gmail.com</a><br>
&gt;&gt; Cc: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" =
target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
&gt;&gt; Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docke=
r: update to v20.10.25 + 58 commits to fix compatibility with go currently =
in kirkstone<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Aug 14, 2023 at 9:00=E2=80=AFPM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@list=
s.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&=
gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; RFC, because I&#39;ve only build tested this in kirkstone, waiting=
 for whole image to build to test it in runtime<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Passed minimal sanity check on rpi4-64:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; my fat fingers didn&#39;t pass copy&amp;pasting test, here 2nd try=
:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; root@rpi4:~# systemctl start docker.service<br>
&gt;&gt; root@rpi4:~# docker run -it --rm ubuntu<br>
&gt;&gt; Unable to find image &#39;ubuntu:latest&#39; locally<br>
&gt;&gt; latest: Pulling from library/ubuntu<br>
&gt;&gt; 5af00eab9784: Pull complete<br>
&gt;&gt; Digest: sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b=
1f33a3dd7f508<br>
&gt;&gt; Status: Downloaded newer image for ubuntu:latest<br>
&gt;&gt; root@92414c21da3d:/#<br>
&gt;&gt;<br>
&gt;&gt; root@92414c21da3d:/# cat /etc/lsb-release<br>
&gt;&gt; DISTRIB_ID=3DUbuntu<br>
&gt;&gt; DISTRIB_RELEASE=3D22.04<br>
&gt;&gt; DISTRIB_CODENAME=3Djammy<br>
&gt;&gt; DISTRIB_DESCRIPTION=3D&quot;Ubuntu 22.04.2 LTS&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8193): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8193" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8193</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10073860=
3/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/100738603/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000ecb57f060303ef54--

