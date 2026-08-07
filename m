Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A3CC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 18:31:41 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48984.1786127493269045222
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 11:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ff6LPhHD;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c15bf5000so17994951cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 11:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127492; x=1786732292; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhyIYR6cUhUgXsj1mokz+zX2DAyvDDP2IFMu7GavRNg=;
        b=Ff6LPhHDcOyE4NliqXy87DmPMBtQ7UQNi9dLOO/IUqv/yyeZccZzeY2lDuWKMmGxIv
         5wo98XsoVpLt84HSF0CukdczwrnGRvdnlPxNrLjfhTLkX0SJDaHZiV6tpk50qxZqmwEt
         TIbQd8mn/MBnXY6wRrIm5LEYUCf8fyaKKy4nJHFPTjBTVO0lX1LLuNViCgLb4orSIUMZ
         /jcv72GQ/5MuBxRrfblcBNDsqIHIxXA/sxwbDq1YhujUq0ZyhdNy/hiXzMsGNFDj+LZb
         6YYtGhI7OEcLMtQs2dstME/pJNHr5+NzCc4tBFF4+G3Ncf5wOY9qq6sXM4sUpSyiKHSK
         Q5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127492; x=1786732292;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhyIYR6cUhUgXsj1mokz+zX2DAyvDDP2IFMu7GavRNg=;
        b=AFDeclkxjC1+rvL/y3BYx/no+YzyzCybyl6mnKIorzPQ/SCnMhRwAg/jaQfFoiC/hx
         wy/oDBPPH/ZJDgjxlZDonK9QaGY9r3zJBt6IIaNHz5CFNL85FhNryzhc6rEEInw4qE+j
         uCJELQuy1nfkKhuON1SLc2mlPdZveebHKiSfzkulBUvjUpC1qRns8nIjvNJq/olm0G0W
         jq1+2awZIz2WGVer5oBZO1d+OPILUbIZ5H0i7PUcklvOEAefuAEdEoMBFkJWGVaRVl5G
         moeIdq3aVwN5ajOLRsvK6JrCyak3PgzoNJ5rljn7p6pmeeZT6sv8AA9xW8H2eXWxuH/Z
         zBwA==
X-Gm-Message-State: AOJu0YyQDPDinjz0A+ueaH+8fdxPFtn0mMTiJZgtuM/c0y2ApvEgcFQ9
	/z6CoOkSgPgnFn2n241O6txSP+Hx46B9UZ29T+R5Ufg5Wq6e0GZdWUNIuLtcDuI3
X-Gm-Gg: AR+sD13TdhUHUVqqTJ2bD/Jd+cchbqaPlujxzivCOuSzS8IJR4+8FivALIeg9K6NkVz
	Rz2APrY+FIxKnXjLHYa6hAWwBaQqZzltdSzIdoY5jYuvARoMCihJu2QNZTBbT4jqEYaGoGKol9T
	oNd+MARO3cOYD3Oxrpk6/7MNU6EYgCoiLF7fL37gKMui9Rnox2zG/dUkakn8OhNzFCtClAdAaoq
	bDmJ8f2jYNypUACygm/9P3mCj8fFoDdvBl3Y4GwLsQxPYiv+6YXPz8NJ4qEtil5ekMtk0d8WduM
	oe5d1UyOt893LqdfQS674X6sCcFvAdynVxUZLINrLTduojYrzDFr5jVVCBbuHPpH0bG8a+lWNuL
	tJLjVTtgeoqyrrzUJTo+jBBtHSXucTFCmD5b08a71bdvclWGY6Bf9ZMLKOtJ5WEgCVdXE6o2f7R
	KuKRfiF5mOvDu6V3oo8cERfv214m6ymfHzq5H0W9p1MBZB98Zg1bBoYmW1NLqbmcglclrCs6SPb
	7S6JQgd8wjqN8++4go6CnhSDhdjbUWJbNHQLnZh/WQo4HuJet+HHBSdXxMsz5TOGHP2UHP8IsyZ
	LjLYpYHrd2bSzWWNT/+pd3uVgXTkC+Newt/r958OoofS8HrnfOYJi9l3yl6Ysw==
X-Received: by 2002:a05:622a:998:b0:51b:ecbb:206f with SMTP id d75a77b69052e-52ce6182feamr293847771cf.32.1786127491966;
        Fri, 07 Aug 2026 11:31:31 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a932e552sm14463156d6.39.2026.08.07.11.31.31
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:31:31 -0700 (PDT)
Message-ID: <6a762483.ce53cff3.11d7ee.5f7c@mx.google.com>
Date: Fri, 07 Aug 2026 11:31:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v3] Add Eclipse Ankaios container
 orchestrator recipe
In-Reply-To: <20260807073153.2186092-1-kaloyan.rusev@elektrobit.com>
References: <20260806110607.1627844-1-kaloyan.rusev@elektrobit.com>
 <20260807073153.2186092-1-kaloyan.rusev@elektrobit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 18:31:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10039

Thanks Kaloyan, and enjoy the vacation.

The v2->v3 changes address what I had, and the license comment
referencing deny.toml with the specific crate mappings
(ring / foldhash / borrow-or-share / unicode-ident) is exactly the
audit I was looking for.

The end-to-end test image + README is a nice add too -- it makes this
actually reviewable in a QEMU boot rather than just parsing cleanly.

Two things I'd like fixed before I take it. Neither is urgent; happy
to hold until you're back.

1. LICENSE uses the old bitbake-style '&' separator:

     LICENSE =3D "Apache-2.0 & MIT & BSD-3-Clause & ISC & Unicode-3.0 & Zlib =
& MIT-0 & OpenSSL"

   OE-core now emits a "LICENSE is using an old syntax" warning for
   that form -- it wants SPDX-2 with 'AND' / 'OR', alphabetized, no
   commas. We just did a layer-wide sweep for exactly this warning, so
   a brand new recipe on '&' would go straight back into the same
   pile. Suggested:

     LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND ISC AND MIT AND MIT-0 AND O=
penSSL AND Unicode-3.0 AND Zlib"

   MIT-0 might need special handling if oe-core's COMMON_LICENSE_DIR
   doesn't ship it

2. The inherit line and the comment above it disagree. The comment
   says:

     # Add cargo-update-recipe-crates so `bitbake -c update_crates
     # ankaios` works for future maintenance

   but the actual inherit is:

     inherit cargo systemd update-rc.d

   cargo-update-recipe-crates isn't there, so `bitbake -c
   update_crates ankaios` won't actually work. Presumably you meant:

     inherit cargo cargo-update-recipe-crates systemd update-rc.d

   That was the intent I was checking for -- future SRCREV bumps
   should be a `bitbake ankaios -c update_crates` away rather than a
   hand rebuild of ankaios-crates.inc.

Small style thing (not a blocker): `require ${BPN}-crates.inc` sits
above `inherit cargo`. Usually `inherit cargo` goes first and the
require comes after. Doesn't break anything the way you have it, but
it's what most cargo recipes in the layer look like.

I'll wait for v4.

Bruce

