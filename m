Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C12C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 18:24:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.66.1716488635534019078
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 May 2024 11:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=ojLEayE4;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.221.46, mailfrom: troth@openavr.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-354f51ac110so1702771f8f.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1716488634; x=1717093434; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cWG6J4muLBDKMIWvn1bPQViReNDJ3rh1QhmaYkRlh6w=;
        b=ojLEayE4R9UuH9iYLtVb+sY1DN1d54rNUTUPrGUGT5gCWfN697Bhs1oGBw36ru7eH3
         ECqQjvaJIcjS2+33DpAAUyKvqoOEKjqXBj0uzDnLTnow0y3cEASt1VM7j4RWf/ZgpcwM
         PSXHqJF3lFt9wnGldr0dXAIosm0XgXaVJ94b2WmRKYl7PjM0EbEGthl9wCPZhrt7swe6
         ZI9+E+seRTWU8Hz+rzOIeeSMdJ2L48OB2dtc6eSDWcScNM32lVZJR/LoscCRvYujtQYE
         QsxezMmLUdMIQ/PgLZScOI4iZN9JJFXqeqQP2TVtvbM+TIjnngpHu/WHvanDYerxFUg9
         3Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488634; x=1717093434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWG6J4muLBDKMIWvn1bPQViReNDJ3rh1QhmaYkRlh6w=;
        b=Ox0VlrZ4qCfoYJp7zhlC3RJy0mqH0ok1HuRm4SW6mDvEZKXRRQbB1sSLXsEKNbQOBJ
         XX/D4cJj/xhjGvEHmNB2CP1nA87baYwlczM/GUHGZoxbIPJMZo1siL/qDEqBaLKudrOm
         QgWLPUtb3/FQRGrX2l0mWhjqVbwJgd+btR3+27fE++hiUMfWeWzAbTTPneOvtrXCeqIG
         q1gnJowrm4MQDoYVmjkwhSKquqsG63hneRvAZGDjW++z3iwC8hDh6LiVyxq74CrTRuT0
         3D5IZIUbSIhfnPtAKzaeQdn2iP6w+6v+dQvN0ITELXfTzdLy8iz7o5vp/ljoLMHR39cI
         tang==
X-Forwarded-Encrypted: i=1; AJvYcCUKdfrV78kF/5KeAIcoky2pUq9sXXu6l28S2ZSvcfvIR1to09RswizrGmYxKLwrw6gStU3j4SQ2Cnl4b00ya6/awlrA+90t6V8qzhuvzyZAmPx4itT0vDaoZHs=
X-Gm-Message-State: AOJu0YxuB4f35fIF88Rq3nw3mx3gU7lfv8QaTGCf4x5riNLg9OTJPhHw
	5WxE6fezpqIhmeJiv+TavyDBA2JVqClNhwiZ3q8h/VYlfEXDwwqv4VN1ryqhg4aJjXUOpVp99IU
	wX/iaXvZeMQtpucxw122JmlALoml13WFaULl5+Q==
X-Google-Smtp-Source: AGHT+IGaeC5RChhGcjljof7kdxz6DLxqpaBWT9AFuNXA5A7Mf0ZwyOLd+lnXlC0+B/aeoinZofYfw/ByhaSZdHWldPo=
X-Received: by 2002:a05:6000:1cc3:b0:34d:9456:b8d6 with SMTP id
 ffacd0b85a97d-354d8cf4582mr5274926f8f.42.1716488633797; Thu, 23 May 2024
 11:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
 <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
 <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com>
 <CA+chaQd=BcD17hyZg5VDCSajtQ56aG=YJeRmGr3s+tsRsRkS9g@mail.gmail.com>
 <CADkTA4P5u3NVBO-3itqOE931ik68caKdR-2kXgdseADr9v=9GQ@mail.gmail.com> <CA+chaQc94P6-yfmJRhM4Mi5gK9MVkq3MFGw4Z_Nvns_U78TdAw@mail.gmail.com>
In-Reply-To: <CA+chaQc94P6-yfmJRhM4Mi5gK9MVkq3MFGw4Z_Nvns_U78TdAw@mail.gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Thu, 23 May 2024 12:23:42 -0600
Message-ID: <CAFMvBt2Rk1BBVWnqJaLmmVtbi2Dpb_cMQvnY6FVjMfbXdhEh6Q@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000047720a06192327b5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 18:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8743

--00000000000047720a06192327b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 2:34=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> FWIW: My world build with oe-core
> master:094273bd7d1768e14fbdcd2f239bee14c630a625 (so before the main
> UNPACKDIR changes) finished with these failures from
> meta-virtualization:
>
> ERROR: Task
> (meta-virtualization/recipes-containers/cri-tools/cri-tools_git.bb:
> do_patch)
> failed with exit code '1'
> ERROR: Task
> (meta-virtualization/recipes-containers/docker-compose/docker-compose_git=
.bb:
> do_populate_lic)
> failed with exit code '1'
> ERROR: Task
> (meta-virtualization/recipes-containers/docker/docker-moby_git.bb:
> do_patch)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-containers/nerdctl/nerdctl_git.b=
b:
> do_patch)
> failed with exit code '1'
> ERROR: Task
> (meta-virtualization/recipes-containers/runc/runc-opencontainers_git.bb:
> do_patch)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:
> do_compile)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:
> do_populate_lic)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_compile=
)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:
> do_populate_lic)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:
> do_compile)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:
> do_populate_lic)
> failed with exit code '1'
> ERROR: Task (meta-virtualization/recipes-networking/netns/netns_git.bb
> :do_patch)
> failed with exit code '1'
>
> the UNPACKDIR changes will probably cause few more issues, I've
> already noticed one with linux-yocto_virtualization.inc and added
> temporary work around here:
> https://github.com/shr-project/meta-virtualization/commits/jansa/master/
>
> will send what I have later today as a RFC (as I cannot even build
> whole image yet) unless Theodore gets to it sooner.
>

Martin:

Spent most of the day fighting with UNPACKDIR breakages outside of
meta-virtualization.
Finally got to the point where I could build your WIP changes. Found some
issues with the
runc recipes and have pushed fixes here:

https://github.com/troth/meta-virtualization/commit/f604f1fb39fad9f496700be=
59333edcdc3e7a633

I'm still waiting for a full build to complete, so I have not completely
verified the rest of your changes.

Ted Roth

--00000000000047720a06192327b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, May 23, 2024 at 2:34=E2=80=AFAM M=
artin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">FWIW: My world build with oe-core<br>
master:094273bd7d1768e14fbdcd2f239bee14c630a625 (so before the main<br>
UNPACKDIR changes) finished with these failures from<br>
meta-virtualization:<br>
<br>
ERROR: Task (meta-virtualization/recipes-containers/cri-tools/cri-tools_git=
.bb:do_patch)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-containers/docker-compose/docker-c=
ompose_git.bb:do_populate_lic)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-containers/docker/docker-moby_git.=
bb:do_patch)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-containers/nerdctl/nerdctl_git.bb:=
do_patch)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-containers/runc/runc-opencontainer=
s_git.bb:do_patch)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:do_co=
mpile)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:do_po=
pulate_lic)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_compile)<=
br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_populate_=
lic)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_compi=
le)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_popul=
ate_lic)<br>
failed with exit code &#39;1&#39;<br>
ERROR: Task (meta-virtualization/recipes-networking/netns/<a href=3D"http:/=
/netns_git.bb" target=3D"_blank">netns_git.bb</a>:do_patch)<br>
failed with exit code &#39;1&#39;<br>
<br>
the UNPACKDIR changes will probably cause few more issues, I&#39;ve<br>
already noticed one with linux-yocto_virtualization.inc and added<br>
temporary work around here:<br>
<a href=3D"https://github.com/shr-project/meta-virtualization/commits/jansa=
/master/" rel=3D"noreferrer" target=3D"_blank">https://github.com/shr-proje=
ct/meta-virtualization/commits/jansa/master/</a><br>
<br>
will send what I have later today as a RFC (as I cannot even build<br>
whole image yet) unless Theodore gets to it sooner.<br></blockquote><div><b=
r></div><div>Martin:</div><div><br></div><div>Spent most of the day fightin=
g with UNPACKDIR breakages outside of meta-virtualization.</div><div>Finall=
y got to the point where I could build your WIP changes. Found some issues =
with the</div><div>runc recipes and have pushed fixes here:</div><div><br><=
/div><div><a href=3D"https://github.com/troth/meta-virtualization/commit/f6=
04f1fb39fad9f496700be59333edcdc3e7a633">https://github.com/troth/meta-virtu=
alization/commit/f604f1fb39fad9f496700be59333edcdc3e7a633</a></div><div><br=
></div><div>I&#39;m still waiting for a full build to complete, so I have n=
ot completely verified the rest of your changes.</div><div><br></div><div>T=
ed Roth<br></div></div></div>

--00000000000047720a06192327b5--

