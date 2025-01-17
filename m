Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E95C02188
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:09:32 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.3076.1737140972163013406
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 11:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FIg4PB+R;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so3372925a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 11:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737140971; x=1737745771; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTcSM9NEq2qakcsU/qYb0wcuXaNReo93B5TRMREV7E4=;
        b=FIg4PB+R/wiwqI8BGqB4DWPXlSXfyjzYhuDfjO7JSFwfgnMxuGEFLDPead90VoUI+c
         9UTiME9/WiWRDrDKeJ8k8wr2h6egmEeEdj8xtMwPNdCxj4CNExnAQ2gzliajlCcFgYlq
         4OODnbd9sU23nWJwTVFKqiDE/ERS0wZcpHlGLW+hYDZRXtzHGz0NP5kha9R90lYK8lok
         Do/0U4gRzdx68PlTBdG9tIkkMC5ajwWAEz1U0oGvQUUy84ZqWjE520FOFARnK5Xkkg40
         3uWL3l4RDoPhzUCL6piT5qb0ZrBSITmMjq7+P2W6kUadnKzRtSPDC7oOF9OXyHAt3i3r
         HkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140971; x=1737745771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTcSM9NEq2qakcsU/qYb0wcuXaNReo93B5TRMREV7E4=;
        b=EH7La0RpNwZM4gAORbyHKAnrKIYZb1NFbj7W0vuHl5kuVRGa6K5WtMlsw1mWmtEe4A
         raCrW2w7TsBQ259nTfqP3x2JML2m5pjVA+YrZccdaParIRgN9GBCK2zRWW3nI576yVkH
         U7nPW5I9WVY6bxEBUeW2z+VNuOInrfKjqe2tfgSNQrCL1u3jUI/3VAtDmlmQAmrOteI4
         O9JbzA3czDL0XZAH5Dfgx5mH236t4unQ0InJyMxhYidm63yBklVC7pAwMwBP9vfT+Tit
         jvKu16jetozo+z/mFmerZXihbGURC0PxB9LH2rkdx+QIVZ82r4Ft/xhuQIxD/34/ePUp
         Rb6A==
X-Gm-Message-State: AOJu0YznD3yLE5ldPjPBZD2/11KI/WVkw2Z02OqdWnHl2cKAhnvOPudh
	2QNi5puRLuv6k0I/fL/4lZ87y8MW1D5X/+xZHN8nfwYI+DjlwoncTo3mLR149/Rp7vrBqoKPR6p
	+AcXsL3mTAbEHCi11+HUSSpC/IQE=
X-Gm-Gg: ASbGncukRCrW/mywuhlK9n3sHoYq7+Zg+wQrWrMXJ+++0PHd7wwOd/O66Aw0L4CAk8v
	nQuwj+IOWVllRiQSlmhi8WOnkQot7POIyq/t7e8w=
X-Google-Smtp-Source: AGHT+IH1kFakcpbCwcSiJEONby72L7JmUeqh4N8IaoZlm079AMu8Vngj9YJtRMbTQbMMZtoTa42ik2t7oI+5enMRD78=
X-Received: by 2002:a17:90b:2c85:b0:2ee:b2e6:4275 with SMTP id
 98e67ed59e1d1-2f782d302f5mr4464703a91.26.1737140971364; Fri, 17 Jan 2025
 11:09:31 -0800 (PST)
MIME-Version: 1.0
References: <Z32oImpdKNsHV77n@gmail.com> <29605.1736326774982501371@lists.yoctoproject.org>
In-Reply-To: <29605.1736326774982501371@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Jan 2025 14:09:19 -0500
X-Gm-Features: AbW1kvZC3yEdSyT6cit1e85qNUmNdF0jINFYrKGU_6HDomUyqsTKfkcVyqmJs3k
Message-ID: <CADkTA4NfWVmkqQ8XcGpjf=ege346_Dd9QntpfV5wnQNBUPiWHQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] image-oci-umoci: preserve file
 modes in rootfs
To: FlorianWickert@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000085e80b062beba6cf"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 19:09:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9097

--00000000000085e80b062beba6cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 3:59=E2=80=AFAM Florian Wickert via lists.yoctoproje=
ct.org
<FlorianWickert=3Dgmail.com@lists.yoctoproject.org> wrote:

> I initially tried to use cp -a but that gave permission errors and I
> decided to just
> preserve the modes instead because that's what caused the problems in my
> case.
> But I agree that something like cp -a would be even better.
> Maybe even a hardlink would do the job, instead of copying all the files
> into the
> rootfs directory, avoiding the problem altogether.
>

Looking at the other IMAGE_CMDs in oe-core, it jumped out that it was
mainly the ownership / user IDs that were the issue. When something
like tar is used, --numeric-owner seems to avoid the issue.

We could switch to something like tar, or use rsync, but for now, I'm
trying a middle ground of sticking with cp, adding -a and using
--no-preserve=3Downership.

That seems to work in my tests. I've joined our two commits, and
pushed them to master-next.

Bruce



>
> Florian
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9078):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9078
> Mute This Topic: https://lists.yoctoproject.org/mt/110474242/1050810
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

--00000000000085e80b062beba6cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 8, 2025 at 3:59=
=E2=80=AFAM Florian Wickert via <a href=3D"http://lists.yoctoproject.org">l=
ists.yoctoproject.org</a> &lt;FlorianWickert=3D<a href=3D"mailto:gmail.com@=
lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div>I initially tr=
ied to use cp -a but that gave permission errors and I decided to just</div=
>
<div>preserve the modes instead because that&#39;s what caused the problems=
 in my case.</div>
<div>But I agree that something like cp -a would be even better.<br>Maybe e=
ven a hardlink would do the job, instead of copying all the files into the<=
/div>
<div>rootfs directory, avoiding the problem altogether.</div></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">L=
ooking at the other IMAGE_CMDs in oe-core, it jumped out that it was</div><=
div class=3D"gmail_default" style=3D"font-size:small">mainly the ownership =
/ user IDs that were the issue. When something</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">like tar is used, --numeric-owner seems to =
avoid the issue.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">We could=
 switch to something like tar, or use rsync, but for now, I&#39;m</div><div=
 class=3D"gmail_default" style=3D"font-size:small">trying a middle ground o=
f sticking with cp, adding -a and using</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">--no-preserve=3Downership.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">That seems to work in my tests. I&#39;ve joined =
our two commits, and</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">pushed them to master-next.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<div>=C2=A0</div>
<div>Florian</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9078): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9078" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9078</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110474242/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110474242/1050810</a><br>
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

--00000000000085e80b062beba6cf--

