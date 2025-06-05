Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBD6C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 07:29:38 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.1679.1749108568373623129
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 00:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/cmW9gP;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32a72e61a3fso19305401fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jun 2025 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749108566; x=1749713366; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSJErSe6lvR67nLIazPuPPC/6MQyoiuXJt7Rezai4uI=;
        b=m/cmW9gP4qFTEp5CuTR4l7n1cs7pu7XCbSTBHVcN/nT739kqj2nHgE/1cEi1uyVeTz
         orh83alt28x4rfVsGiYkp+O/81Dv97odVp07QrkCzQSivoXXo8LN/+qs8AYc1v6Q0NzV
         d/GoOqu4UFIR4igaT0VfA3ltvaNl++qhYkl1GLTeaoUlYtmS/2DZDzOZwe1bXMwUNuSD
         BaYF+6LYntANwELIYkaGxe1uEB6r76e2A3GDLNLD9sepsveUOmXo20YBpI+mAVIqOilo
         u3kigjtG3ifFDbtB7a1045gP1+OfRs1NzgJti6ZpD1bGulwhresl7d0xQUQ36bNYhGOX
         T0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108566; x=1749713366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSJErSe6lvR67nLIazPuPPC/6MQyoiuXJt7Rezai4uI=;
        b=S4+viOFZefMY4Cmks3Qsvr7kEb2Fh9DV+16t0EpdLWs8kufAkbEPDR4sx7BhXbvdVw
         i0inKruzn0bSP5HZS/KGKtw9bMTqyQCQpQ1CNUbcAj/6GDgx2bvxEEDFtTTyQzc32/9z
         f+FUWjukzA/QBB9rrz9UT2Ga+yISVB7cWd8AuNo6yUX2Cqe9dd0BNp00I4vNr5bNqot4
         s7iGb/jK/sWs0Vuq5ANdd8uxLJEKU6WjPhOUD5NrJzO/D15bchVNUD5WfFov7CQEmBhk
         ZzsF50ucXhSqsnMAYYe6yBCrlU5qGrHXp8M8q9Ty3auIwG/P9m2F5BSRs9nypllq1jsY
         inmg==
X-Forwarded-Encrypted: i=1; AJvYcCWf6ELQYYpywuAEOLuxjwgSV/nFmVbXK+8U38Mfp2kqJZgHIXoRePsr05Z3JsFsIYFL3+vnxwZWqdz3R0/ItfV4Vjkg@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxiQSgG7uitBMwbk1oTCS77A+1OV1L9Hau4KiqK22dlCDknQmb+
	j9yowlFfHdCcn35DDuTj4iPhy+L1yzUBXzBFDIQW/xHWEuucnyeJreqk0PYWAr/wef58DOE5uX1
	cch3F1BCrddHFOk3bcxRfQjKHRwbv5M0=
X-Gm-Gg: ASbGncsLQgxc5FJCcNd7IWr3RbOms8o6YmUSohwiwOTkFcRPNPD326DUF9S9nboL07c
	qNJcmJwsT3Thl9HDLTkV1qNwCcaq5UvIDvETiIFFQr75XmG2wX9Ir32CH0K91UmX4cRVOOQpvP5
	YhdNwqwI7AOahHJr+JA53bqir1tY4GhIeXqtemHzQQh9ajwA==
X-Google-Smtp-Source: AGHT+IGqTZa64uJIa6NQVO54eMaumQ0665PXX+BDCBNo5gSrJUitPfc2DuHQTJgrZ+g4kipnnONm74pBNqvlPE1SIAg=
X-Received: by 2002:a05:651c:30d6:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-32ad11bf3d6mr8151061fa.7.1749108565870; Thu, 05 Jun 2025
 00:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250526210708.3721789-1-patrick.vogelaar@belden.com> <aEECRB/Bswa29tiz@gmail.com>
In-Reply-To: <aEECRB/Bswa29tiz@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Jun 2025 09:29:14 +0200
X-Gm-Features: AX0GCFud0Ns2qbR1KU9Hzo9pMHZxUorLjdbTY1OilIZ7swrxy9yIhIrxjFgzfBs
Message-ID: <CA+chaQcDJJfCbDpTWdxUUB1YUt=r1cHtGKhJe536PB3tA2AwfA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] cni: make ca-certificates a packageconfig
To: bruce.ashfield@gmail.com
Cc: patrick.vogelaar@belden.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jun 2025 07:29:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9272

On Thu, Jun 5, 2025 at 4:34=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>
> Something mangled the patch in transit.
>
> I had a reject, but fixed that up.
>
> When I pushed the repo, the author was invalid (the mailing list was
> referenced), I ammended the author so I could push it.
>
> I know I've sent the instructions on how to fixup a send previously,
> but can't for the life of me locate them right now.

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fix=
ing-your-from-identity

