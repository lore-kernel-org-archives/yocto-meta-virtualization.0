Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B8DC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:34:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.13729.1699371249170093466
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 07:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HbrY6dh7;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507a5f2193bso6255914e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 07:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699371247; x=1699976047; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lrs9zpzvzheEoJBSS2OeqczVUYosT5lXfHvGAfqrg08=;
        b=HbrY6dh7bFsqAXdBW5wNUvvtY401FbW2sDgZIge38dkoYwTYMwI5D4WeokYXylpWnA
         BvHbiJu88lV61983oA6LiyAG+ANE3ZWniLR5A1c/uFgo6NRVmvV+1v6h4s7be1Bmmnu4
         mWKaubS4ktjIQKrb2UXHwtshOUsTiIDbnGqgBTL4+eQUzZW/UAjho6yh7EfCVcKMGq7A
         tK0cuBzqGv5GV6Kfs3gpy7xIquluB/QJWqEZCS8R6vBU3QA5PF6f1F8wWioj4a34N1Ys
         LwRs3Gy/VYI87WmoNXSomaTpKv2WOO5yMcnGiHvJDCJC1brU6bmI+DVZrSP4zAfF1rLT
         p2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699371247; x=1699976047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lrs9zpzvzheEoJBSS2OeqczVUYosT5lXfHvGAfqrg08=;
        b=uQ3+jqjN/es9X3fPbQffPTOKiq9G+NJPvUaN3uPaWuN1Bufl245ItanBsS14ME1AgR
         uKkCv6m2Q+u6tAHlHEzFiKrUfJnPnYUEMjiUZUJ359GV2oLf5BGpGfDnRpEcl2JAVcmV
         kbZlfzBXupeZZk3kwIi6qcbNxdIM208J4mimT7ul6vUK8fGW5XnDTz3079FIhG/uPFFK
         kyF5h9vywv8tm8sLaiQRRKnBajyouWoPm00YDWle2RqiOogwMX5vSr8XeiIqXoFM7C63
         Vt6opL2qiU+NNM+wFisbQAyhXrhKbR45J7bzfZIFB+l3pT6FWDcNUJXKoT9LbgJtFJUZ
         bVEw==
X-Gm-Message-State: AOJu0YyqaWvm7Vt1LhS6z5XlHQxi2djb41GM4nnJlQ6xBmTmazLmJXK1
	C6mhynAmdSoYg5JwzjnmrSWVWwUNL0s2BQ12zSQ=
X-Google-Smtp-Source: AGHT+IGZAWS8U3InOKXSd7AyS4KZku1XISqc7Pj64p+cx8P2IjyMt44i4Lgg3lAs4QOiKqC+y4M3v0Y1i49unrWdG8U=
X-Received: by 2002:a19:f502:0:b0:507:cc09:59ab with SMTP id
 j2-20020a19f502000000b00507cc0959abmr850473lfb.9.1699371247000; Tue, 07 Nov
 2023 07:34:07 -0800 (PST)
MIME-Version: 1.0
References: <EA68EAA4-BD24-4273-8F76-0725EB0F2FDB@arm.com> <CADkTA4N=HDdetz=wMh80c9NSu5rNjThVVkGvi1HcDwit-cBN3A@mail.gmail.com>
 <75A405BB-43B0-4AE2-AFF6-C87429EC29F0@arm.com> <CADkTA4N5ZDEqt1FnpEE4A+JGBvG4NMqyPNMU6V6=qn66GNT7AA@mail.gmail.com>
In-Reply-To: <CADkTA4N5ZDEqt1FnpEE4A+JGBvG4NMqyPNMU6V6=qn66GNT7AA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 7 Nov 2023 08:33:54 -0700
Message-ID: <CAJdd5GZRHSZ6hKAon47eHCK9-+YFNxKn_RqQF-CwmBy3zz+5fA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 15:34:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8446

On Tue, Nov 7, 2023 at 8:31=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
> On Tue, Nov 7, 2023 at 9:51=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> =
wrote:
> >
> > On 7 Nov 2023, at 13:00, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
> > >
> > > I'll do both: branch and revert there.
> >
> > Sounds sensible, thanks.
> >
>
> As it turned out, reverting would of course leave the issue unfixed
> that Joshua was addressing.
>
> So I copied the mapping routine into the class and did a nanbield
> specific commit.

Thanks Bruce!

>
> Bruce
>
> > Ross
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

