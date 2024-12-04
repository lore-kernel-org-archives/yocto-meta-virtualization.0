Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FF0E7716F
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 21:18:07 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.26118.1733347080287554960
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 13:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFhv7qgL;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffc86948dcso1664361fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Dec 2024 13:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733347078; x=1733951878; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ANjVnvbLjm8HHc5KnNPPeT2B1WrzIUmZnC/XEJwBelk=;
        b=XFhv7qgLIJoMkDrCkcDiqD8HkCZnlAsmL3vmsmV6JE/uANIApZx2XFGh8E47IRR41h
         oZefMArzDn62l4zNLP2EQ+zbY5EYGlGTztwcPtZ5KblTCjQH9Z8QsXyKvVzui57ukqfY
         tgfnn6fePwhnD8JFBNqku6h2nkRMbwL4w0E2TI7rdgcocR9TlZ+fH/7AAf4ZdBA+VHqD
         cvzfbeIDUNkN2knMaEg1bfAXiMbnM/7gY1drv/7ANOj9fCP+g1krULrt/ZW2ImLsugDl
         1OiY3Ju+TnN7IG0BipV2lmBKxm/pPQTI4VkKdZ5QJ6/l2C69ONaBY2urx6FbN8G3Uw5r
         LDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733347078; x=1733951878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANjVnvbLjm8HHc5KnNPPeT2B1WrzIUmZnC/XEJwBelk=;
        b=GVGst1IhSjO0NrubXfKDSQxK9AvBLRYhVeRiqDM6DuCrAvRtOO0XAwpbFRDQkMdjN0
         GnwEYxxBO5RI6q8NHkEs2VqCkYDw5TCW4e2N8MosfWHXaG/+qob+MKX7A93DFh3ggLiy
         qAJY4T2xmlTux0pOFhMGUL6iMOINuovfrLOMnQ7rharRaD9yuch/mFAO8/wXTcmiMLDO
         YfobqQl8KK1M5JuUszVxPqwWIZbEobci9HBLC7PiaO4rOkyt7Lp4Z1QQYrvGibjTEUA1
         bov989C++IM6WQ8ZZWxORC21dTh5wEhh9+JpI56BPzNMGXinp8LUobPC3HJ3Cpy177hO
         XXYA==
X-Forwarded-Encrypted: i=1; AJvYcCV06ZcH/Pma2Gtc0DqPXAN1GiSJBME66XtJB63+D0ee8cx7rbFo+jx47w+vpSMNtBEG1ThgtzsFBQHeQkr8hlavcaMK@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwrZYKHcA+CBTEgPGtXLswwRkWqo4/06lrcSdJwEUl6SWHqyPyI
	yQov3djY0eNRDgAWD2p+SNtVN6PLkeFuNgakHq3sFD0bjAItpEmv8XlPgaqUaQRT2NSOy/ogxfs
	RU1jdK3kNvMNK8zdSUsCGdKK98ao=
X-Gm-Gg: ASbGncsJPLqcaFa7GAomiHlpZFBrDdcFoP5oPT8K9wUMPQsF5j4QqnoAVPPvsn+JJ9N
	gAOkRsTfaFE4vCFFtruPNQCIP6hboWQ==
X-Google-Smtp-Source: AGHT+IEtcOlcvhB4ADxG/M7DJEUYoc488ldJ3X7/1dIk8euDCq2LOZIxpDHAAryeVYaXAhIeObaiFqdPUfo8uIDGg1w=
X-Received: by 2002:a2e:be0d:0:b0:300:1f2d:97a with SMTP id
 38308e7fff4ca-3001f2d09d2mr3682141fa.16.1733347077024; Wed, 04 Dec 2024
 13:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
 <aa7326cf-be86-4d68-83dc-925907007b1a@amd.com> <CADkTA4PWP4xjFh7fWpWFae3Q9Bc4NWb+ENRxK7hJsKcGB6WYxg@mail.gmail.com>
 <44c32fcb-4e93-47b7-80e0-c48355e84ec5@amd.com>
In-Reply-To: <44c32fcb-4e93-47b7-80e0-c48355e84ec5@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 4 Dec 2024 21:17:45 +0000
Message-ID: <CACMJ4GYnwxR3TP_ERF77H9_u3=znGc_fPehjOhBLxR-4fj_AVA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH v4 0/6]
 Add bbclass for xen launch config variables
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="000000000000cc7721062878502f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Dec 2024 21:18:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9041

--000000000000cc7721062878502f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 7:24=E2=80=AFPM Gundlupet Raju, Sandeep <
sandeep.gundlupet-raju@amd.com> wrote:

> On 12/4/2024 11:35 AM, Bruce Ashfield wrote:
>
> On Wed, Dec 4, 2024 at 1:07=E2=80=AFPM Gundlupet Raju, Sandeep <
> sandeep.gundlupet-raju@amd.com> wrote:
>
>> Hi Bruce, Chris,
>>
>> Do you have any more comments on patches? If there are no comments can
>> we get this patches merged?
>>
>
> I haven't reviewed them yet and probably won't until next week.
>
> Generally speaking it isn't wise to attempt to rush a merge, in particula=
r
> when it has been 5 days with an extended weekend in the middle.
>
> Ok sounds good.
>

I do have a general comment on the series that I would like to see
improved: as posted, it isn't bisectable and my view is that it should be
made to be.

Patch 3 introduces a file defining variables that are already defined
elsewhere, and then patch 4 removes them from their previous definition
site. Since these are not combined into a single patch, the layer is
temporarily broken, when patch 3 is applied, and then fixed as patch 4 is
added, and there are lasting consequences for consumers of the layer for
this class of breakage.

A simple negative consequence is that it adds complexity to the work of
managing other branches where commits are selected from the primary
development branch: the second commit must _always_ be taken whenever the
first is - that's not a terribly unusual constraint when working with
series of patches though, and many patches make more sense in groups. This
is not the primary issue.

A more serious and expensive consequence is that it blocks the ability to
use bisection to hunt difficult bugs in the system. If testing indicates
that a defect is introduced somewhere between two distant commits to the
layer, an efficient way to identify which commit introduces the fault is to
iteratively bisect between the two points on the branch, and test a build
at each - if it the fault is not present, retain the patches applied and
bisect the remaining ones to apply more, and if not, drop the most recently
applied set and bisect it to apply fewer of them, and then retest.
Iterating this way to quickly find a single problematic commit is a
deterministic process and often automatable - see "git bisect" - but that
depends on each commit on the branch being viable, and not introducing
intermittent breakage along the way - if that constraint isn't satisfied
then the build or testing process is frustrated and the process of steering
the iterative bisection becomes more difficult, often requiring informed
engineering expertise rather than simple automation, and so much slower.

Builds are expensive, testing is expensive and engineering time is
expensive, so doing the work to support bisection when patch series are
developed and merged is a valuable contribution to support the engineering
environments that consume the layer, improving their efficiency and
assisting the development of better quality software and systems.

Christopher

--000000000000cc7721062878502f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 4, =
2024 at 7:24=E2=80=AFPM Gundlupet Raju, Sandeep &lt;<a href=3D"mailto:sande=
ep.gundlupet-raju@amd.com">sandeep.gundlupet-raju@amd.com</a>&gt; wrote:</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <div>On 12/4/2024 11:35 AM, Bruce Ashfield
      wrote:</div><blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
       =20
       =20
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 4, 2024 at
            1:07=E2=80=AFPM Gundlupet Raju, Sandeep &lt;<a href=3D"mailto:s=
andeep.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd=
.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
            Bruce, Chris,<br>
            <br>
            Do you have any more comments on patches? If there are no
            comments can <br>
            we get this patches merged?<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div style=3D"font-size:small">I haven&#39;t
              reviewed them yet and probably won&#39;t until next week.</di=
v>
            <div style=3D"font-size:small"><br>
            </div>
            <div style=3D"font-size:small">Generally
              speaking it isn&#39;t wise to attempt to rush a merge, in
              particular when it has been 5 days with an extended
              weekend in the middle.</div>
          </div>
        </div>
      </div>
    </blockquote>
    Ok sounds good.<br></div></blockquote><div><br></div><div>I do have a g=
eneral comment on the series that I would like to see improved: as posted, =
it isn&#39;t bisectable and my view is that it should be made to be.</div><=
div><br></div><div>Patch 3 introduces a file defining variables that are al=
ready defined elsewhere, and then patch 4 removes them from their previous =
definition site. Since these are not combined into a single patch, the laye=
r is temporarily broken, when patch 3 is applied, and then fixed as patch 4=
 is added, and there are lasting consequences for consumers of the layer fo=
r this class of breakage.</div><div><br></div><div>A simple negative conseq=
uence is that it adds complexity to the work of managing other branches whe=
re commits are selected from the primary development branch: the second com=
mit must _always_ be taken whenever the first is - that&#39;s not a terribl=
y unusual constraint when working with series of patches though, and many p=
atches make more sense in groups. This is not the primary issue.</div><div>=
<br></div><div>A more serious and expensive consequence is that it blocks t=
he ability to use bisection to hunt difficult bugs in the system. If testin=
g indicates that a defect is introduced somewhere between two distant commi=
ts to the layer, an efficient way to identify which commit introduces the f=
ault is to iteratively bisect between the two points on the branch, and tes=
t a build at each - if it the fault is not present, retain the patches appl=
ied and bisect the remaining ones to apply more, and if not, drop the most =
recently applied set and bisect it to apply fewer of them, and then retest.=
 Iterating this way to quickly find a single problematic commit is a determ=
inistic process and often automatable - see &quot;git=C2=A0bisect&quot; - b=
ut that depends on each commit on the branch being viable, and not introduc=
ing intermittent breakage along the way - if that constraint isn&#39;t sati=
sfied then the build or testing process is frustrated and the process of st=
eering the iterative bisection becomes more difficult, often requiring info=
rmed engineering expertise rather than simple automation, and so much slowe=
r.</div><div><br></div><div>Builds are expensive, testing is expensive and =
engineering time is expensive, so doing the work to support bisection when =
patch series are developed and merged is a valuable contribution to support=
 the engineering environments that consume the layer, improving their effic=
iency and assisting the development=C2=A0of better quality software and sys=
tems.</div><div><br></div><div>Christopher</div><div>=C2=A0</div></div></di=
v>

--000000000000cc7721062878502f--

