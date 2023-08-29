Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25042C83F18
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 01:59:07 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.8756.1693274341243772687
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 18:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bXeFAYnO;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d73c595b558so3922124276.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 18:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693274340; x=1693879140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tq7PeueeF2RFWTUQH56m9jltrU7PfeX1wVx3EdGS7g=;
        b=bXeFAYnOv4i1Y0yn3kOzIQEVjwtWRLP7VzEbISnnPD3ER7oTXKETVGuqV7Sdi7rqhJ
         8lAseA4D4OGunMBZ/1JxgvS/Z6VYZFdU9mlnS+LnJMM/iSYQcv90MzY45K6UoGz2NsfE
         b+OSxXoN8lMWct7nS8fEjwiFtzp5R+rwvX+gtJIJdMrYL/fDOTdIde4bihVGmYuesFS4
         JyCR14foFt03ptPFm5jqkWK6fX7TWDIX6kSREaLQwosLFPOZDwWck4hrHs+2B4TLCcky
         Uzs1B0kEcaE+EX2/xBNYxH4FeiakII6aL6dGVzZzYhylRpu/twb+4OLDjwL72uGTLxA8
         y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693274340; x=1693879140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tq7PeueeF2RFWTUQH56m9jltrU7PfeX1wVx3EdGS7g=;
        b=dH0qC0pDKezA1cM6tpQoSfjnv3ybyQlJbiJnHPI720ddXiOkiUOEA3jHCyVlwfwJqG
         QmzKDL05JU6jbdZw97eaLo4WnE2O8A7saoYjLf1eQbgjF0S3VUkrxblhgwEoi6zkQLGY
         1LBH3cLyED7nb4R1I/YFdquRXSTIrRcWRhjnZXuFB1n5m4Jxtcz9cLahWTrSKtnLP+hv
         z3tbLFLifbLcI0aV/Kjta8nVlkDMSy0zQRBhqDNgStEA5ugOTa6c+uDYWvLr4qFHjINx
         TR3AdRdGc/nYr1muLdLBFvsVajATI9qWzF6tqqYPeacmeWy/tkvPgj0LVkBOq+A9a7Xt
         sLbg==
X-Gm-Message-State: AOJu0YyhrFB99I7Evw08EgSCsaAT9x1ZzkxmhSXGBmK9tovJbBtOnSTf
	rXXHaz7ztxlmSJd/zbqqWMoRoSw4ZiSqCcPgPrq/XtY7
X-Google-Smtp-Source: AGHT+IG+bUC86CopWkUzXQfrg+GhIHyJId6jdBYenaNFTn5pzsGdwTP3salopSR98v55FTr+Iw9pxOUWqkHT74MgGxg=
X-Received: by 2002:a25:2bc7:0:b0:d78:123:5a97 with SMTP id
 r190-20020a252bc7000000b00d7801235a97mr12788443ybr.25.1693274340347; Mon, 28
 Aug 2023 18:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230828220710.2689454-1-Martin.Jansa@gmail.com>
 <CADkTA4PGWLMN4J8xxmiHzYA7gdWa9UVGK5PgHJHBqvKKCBx0uQ@mail.gmail.com> <CA+chaQcTkyg8pXB0n4LOWORAimASf2Qt45x_E3VkJ+KDFNrGag@mail.gmail.com>
In-Reply-To: <CA+chaQcTkyg8pXB0n4LOWORAimASf2Qt45x_E3VkJ+KDFNrGag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Aug 2023 21:58:49 -0400
Message-ID: <CADkTA4OVeWRrsGLyDTRoUVFgyEBfJnJjMSroq02SgDVvGAThqQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] go-mux: Switch to main branch
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 01:59:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8255

On Mon, Aug 28, 2023 at 9:56=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Tue, Aug 29, 2023 at 3:50=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>> We've got this one already queued on master-next.
>
>
> Sorry somehow I've overlooked this one and seen only the go-context, but =
you're right of course.
>
>>
>> While I'm on holidays, I'm holding most patches out of master until I
>> can be around to deal with issues.
>
>
> Ack.
>
> When back please cherry-pick both go-mux and go-context branch changes to=
 kirkstone and mickledore as well.
>

Absolutely. I split the uprev and the branch change commits, so I
could do exactly that.

Bruce


> Cheers,
>
>>
>> Bruce
>>
>> On Mon, Aug 28, 2023 at 6:07=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail=
.com> wrote:
>> >
>> > The project has renamed the master branch to main.
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  recipes-devtools/go/go-mux_git.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/g=
o-mux_git.bb
>> > index 3f939f4..fb4502b 100644
>> > --- a/recipes-devtools/go/go-mux_git.bb
>> > +++ b/recipes-devtools/go/go-mux_git.bb
>> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc50f6bd9c1e=
15ed0bad3bea18e3c1b7f"
>> >  SRCNAME =3D "mux"
>> >
>> >  PKG_NAME =3D "github.com/gorilla/${SRCNAME}"
>> > -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
>> > +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
>> >
>> >  SRCREV =3D "136d54f81f00414c45c3c68dd47e98cc97519c5e"
>> >
>> > --
>> > 2.42.0
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#8251): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8251
>> > Mute This Topic: https://lists.yoctoproject.org/mt/101020201/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

