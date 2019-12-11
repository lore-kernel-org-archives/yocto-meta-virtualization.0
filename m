Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.533.1576048819542796666
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 23:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMJwDOfa;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 688FEE010D8; Tue, 10 Dec 2019 23:20:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.41 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEFEFE0078F
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 23:20:18 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id e10so18509458edv.9
        for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 23:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NbW86TgxYB6rqWDKMGGPcwMe/epIue7ekvBm6+4zayM=;
        b=MMJwDOfaM58FuzXS0WdHN0rIjEJ/dScKWDUc4Z/qZMSEReA8IuYu9sc7orFq/u7FzU
         GK+jKyLBp3Qn60r0pZvO54WNC3A0zdeZGr28i7ZY1eexbF8WnW6tlR11Ia7xPU7JqB+0
         ZSrv4kiLhRgs5ZkuMnMr+dMadRzoPKRmdg1JNV/B+fxFisKjA0P0IcMfYJ6dyO66lDoN
         S6XnQ6pY1Lz8LDLmOpk+pSn1W2u16NuwV0i1HxmPkHByFyKkmJYXCY5Ea6V8qozMmT39
         RMfGzUPP6vrIZuMwspdON+pBmAAS6STQodn6Z+FRxA2+OJupLlFGjmSHUxVJpFi3kObS
         EMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NbW86TgxYB6rqWDKMGGPcwMe/epIue7ekvBm6+4zayM=;
        b=CT6DCFuwS8XFG15PnB78hQ0wtHD/RHFTUWZbQJWRqGG0ekkzKESo7zKOZeFcLyvxec
         IBbR3C8JOizXgQOBD8qdZTfEDrU+W4FTPFZSQC2T5nJ0lEnvaJ8Rmuh7PgTO+C4ef7bc
         8NRacZx+HKdSWC6p1YoK+/1zLwJJEjtdyLCTQXUwgU+bG0ogfGypJAVoDSYtlUZ2MlNV
         TnZ9Hv0VkSBDzVYesGtt9fcVavQNSF32bHdRjuxFO/4aISk6i3YkD8mEb9SrDsnb/XAa
         qu6eAV53G2HVHnGv6gz+E97WcICc6Rd1dMPjQeMCQy2Mui4awrvhMei1KzfCDL0E8lkZ
         Dogw==
X-Gm-Message-State: APjAAAVUgJ6pbI5MD604xOCPB5STB0h442SSNaJSJ/TUn1uhNY8gTd+A
	abVBjhXTh/UEkkmRJeGWFY+bup/EVVe9ipuamJg=
X-Google-Smtp-Source: APXvYqxeZ2CCeXE96lmTPvtUlurGy47Iu0aPtygWhYktkMkMlmCA/9+XwqCZmqow4azC2bUmBLn297BT8ShyxndFBqU=
X-Received: by 2002:a17:906:80c3:: with SMTP id a3mr1622410ejx.101.1576048817875;
 Tue, 10 Dec 2019 23:20:17 -0800 (PST)
MIME-Version: 1.0
References: <63726798-32ED-4DA0-A82B-8D753AAAB55E@linux.intel.com>
In-Reply-To: <63726798-32ED-4DA0-A82B-8D753AAAB55E@linux.intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 11 Dec 2019 02:20:07 -0500
Message-ID: <CADkTA4M4fqfZLy6YS_gLDAcd3mvtMYoOoKV6i2zr+xj7N1QfYw@mail.gmail.com>
Subject: Re: [meta-virtualization] Hashicorp serf and go-crypto: which layer(s)?
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 9:18 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> I have a recipe for Hashicorp serf (latest release 0.8.5) which requires =
go-crypto. I=E2=80=99m currently planning to add go-crypto to meta-virtuali=
zation, but serf makes sense next to consul in meta-cloud-services. Current=
ly, the README of m-c-s says its only layer dependency is oe-core.
>

heh. The m-c-s readme is wrong on that point ..

> What is the consensus? Should I add recipes-devtools/go/go-crypto_git.bb =
to m-c-s and keep serf next to consul, or should I add recipes-connectivity=
/serf/hashicorp-serf_0.8.5.bb to meta-virtualizaton and keep go-crypto with=
 the other go source only packages?
>

I'd say the 2nd option is the right one. Add serf along side consul,
and go-crypto into meta-virt (and we can update the README for m-c-s
along the way).

> Also, devtool picked up all the licenses from vendor/, so I am adding a v=
endor-licenses.inc file to help keep the serf bb file shorter. Other recipe=
s in meta-virtualization, such as kubernetes, would also have a lot of vend=
or code=E2=80=A6has anybody been concerned about licenses from vendor/ ?
>

We've talked about this in the past, and yes, to be complete we really
need the vendored licenses along with the main package license. So I
think you are talking the right approach.

Bruce

> Cheers,
>
> =E2=80=94Tim-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4858): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/4858
> Mute This Topic: https://lists.yoctoproject.org/mt/68034443/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  =
[bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
