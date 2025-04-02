Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E7BC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:02:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.5326.1743591716072732687
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 04:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aNK0Yij8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5798872f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743591714; x=1744196514; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=87y0aSN2sNWUqHxFzKTPEbLZT0FkNLwmgPdtCx0DFlA=;
        b=aNK0Yij8yePeWs69+724jqWjbAL9zx1CUZ3XFehJ8LJwSAJ4F5wiPT9PuEWPO5dtbV
         NeqJATfkndQQfkDfjl6IXDGeXhfrmsVU6cOt9zO5+lzbIMv9zSW2eBclrO9WdIIibczu
         SMSOv6AZoxac0npRRk7UkoWbsxRxN2wMHb3T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591714; x=1744196514;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87y0aSN2sNWUqHxFzKTPEbLZT0FkNLwmgPdtCx0DFlA=;
        b=bhqJYt1urKrMFxm8qpFsYz/VdHozS0f3etzl+ERo7Khygax6aoWP8NHki7GLx08axf
         Qv8EXHvH0X6zSPc+9GdPzmA/BTqc1w4rGOpy0Sopt6UyDsdZujadmZsbzatS159tRGRc
         V50rInTDi1UbqtH9Gz6nzDWOFClpwL0EAjHSWEskwyDnfTg3D2pRSXVi75nQGOk4BJlr
         7zUDfL7Su+8NtiF7mCr7mIDY+VTVsv6nVGXwYzx/FhEVYcpzAYqOlHoFax1EYsPnol8/
         7Z6MvmpJvgxRE8+bMIhaVP30Nf3DgM4Zy0hpWIWhcUI6ViaGHznwydV5T4nomKs8MPbr
         w3ng==
X-Gm-Message-State: AOJu0YwEbzcmkrdXlfQYbkmu/eTVRFcbyKBlFAoIMawdmJLmQo3VAOYc
	ZxyNw/pnqEYY8Yitg4vUJvIypBBbz+USsQxTk4LFjwGLRWSRmoD4l4alCZidi1fT4PLKjswambX
	v
X-Gm-Gg: ASbGnculbvz+CXZ29W0EWibGOChvNI20MGgdUE4qOdEL9qJtDZnq/lGIZM4RXU1TYDM
	+AXSJIMFK6Sk5DXjSmcdbvj5Hx5DWlNJSQbUZfrnyOH0/QEdjXQKjYZiy5mVa3Nkd68uakVm57g
	JxjAKhdtC1fgIVf1gwWohEDPudBV78qTPvQQ8uJA0TeU3yhn70/pf3n13n1KtECM0hvPRbKg9Zp
	bmpBiVPQcx5wJjdyLnm5gahe9zHYHXDyS222CVL5nZA2nQEz8sItPbvBZlw8MjUsO9joFSK4Un9
	pJ84Oyz7R4oFXUe+hMwuWag07gkKiMJSMoOhcfs5uU2mYt7+DVKT0EBdSGeqBl332GP9bb4jGtH
	Lavteorq08DWtR3MZ9pcP8f4IjvYXHcafEg==
X-Google-Smtp-Source: AGHT+IFQ3CR1buVw/dG+ts4VoO5YegxdYQdy9tGtWHqCGEpZqHcYGPqu+5g5fY9Yp+TUD0ZW816UKQ==
X-Received: by 2002:a05:6000:240b:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-39c13fdedd2mr14484832f8f.5.1743591713843;
        Wed, 02 Apr 2025 04:01:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0afsm16829580f8f.65.2025.04.02.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:01:53 -0700 (PDT)
Message-ID: <a5b5e19262e51cd9b14e65f42efc3367b1af99e2.camel@linuxfoundation.org>
Subject: Whitespace syntax warnings for meta-virtualization
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 02 Apr 2025 12:01:51 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 11:02:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9188

Hi Bruce,

I just wanted to give a headsup that there is a patch for bitbake that
adds warnings for whitespace syntax which we're likely to deprecate:

https://lists.openembedded.org/g/bitbake-devel/message/17508

I've posted it so people can start seeing how bad some other layers
look. I did sort out OE-Core/meta-oe, at least on the most part.

For meta-virtualization, this results in ~1300 warnings:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1253/ste=
ps/12/logs/warnings

Most of these look like they might be script generated, so a small
tweak to those generator scripts might address many of them (he says
optimistically!).

Many of the others are isolated to a handful of files which can likely
be cleaned up relatively easily too.

I wanted to give a headsup of the issue and offer that I'm happy to try
and help resolve it if that is helpful. I know you sometimes prefer
your own patches so just let me know if any help is useful. I also
wanted to ask how you wanted to handle it before everyone starts
sending patches.

I do appreciate we're in the middle of release. Personally, I'm in a
lull while core is in testing so I've switched to trying to clean up a
few different ongoing development threads that were deferred until post
release. I appreciate I'm therefore a bit ahead of where others are.
This isn't meant to be any kind of pressure, just a headsup and a
question about if/whether/how any help makes sense, partly to avoid you
getting a load of patches you might not want.

Cheers,

Richard

