Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AAFCDB46B
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 03:42:35 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.512.1781926955194397806
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 20:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GuEmUOWi;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517de710886so20786531cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jun 2026 20:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781926954; x=1782531754; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2JMRNcuMzO++/OPiuYbwFs/aXjpxXM4G3rpjsYK1zc=;
        b=GuEmUOWi0IO8KhpljQvTxZYwmNkImuKL0qp1bbuPkPJCTVwc26tmmmYuVqD5RCjzwC
         YNY7D4XAix5wMQHjxi/lzb8sJaUb80zOQjb9n81pifMV4fQFkWrweKb8IUIEK9/KmF7m
         UCqbevucD5h0SFK5mLvjKOnhZJ7kbtIBn0EmfQX4aQ5KQbuSbXGFOci4Bg1IJTZ78eun
         Clqx+inObifwSv77oHS8NA592W9LHAsG1D0PgH/ZmK0oV56Vs4UInwG9+MGakYPjG9pq
         rWotLPscFpx72qN2mt+wD1kF7017CWY+EgkPZJDLzSZcrgorQEBFZ3kWjrpa4u/KtTDk
         ghIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781926954; x=1782531754;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2JMRNcuMzO++/OPiuYbwFs/aXjpxXM4G3rpjsYK1zc=;
        b=SxrKQkgNLu0MQx9ySHxpZvnR0BVhlnZciuSIc93SImatSih9Ac1w0syIuYgwLkXoIk
         irv31gH1pFlnjhcO+V7wZ1TZ4ShLBYKrI4r8CbDpch+8B80GWcCcfaxbyGJ4nMzfk8Sv
         QT+22dLZIfLao/DnveWqUz6GQdt7DX7eRUWAWGt9DBcLLIvZBeI6NyI+TI7YH8rjTgbz
         VNyO7HiE41uWaGH9rkZaQz44o00b4Av14sgd+25A7uxZlrmdz3wAfsj9ESmpioy4MDz1
         ckTxdGQlpZ7zbUUZBafsOdWxAiCzBQrA/585LH3HH6dG/kkfurYTrwKE62dU18mzyyp7
         70vA==
X-Forwarded-Encrypted: i=1; AFNElJ9LubeZH2TGsOYyu5MDv4/0tychsFwFo9gzqJupjq3lIEbJfUttO4nN7rajF/xwx/awYwn4dcvHiI3h/Gt5i1kA49Re@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyWfbkyivvL4PX0lnbiC+vbAEX4WLSe72xP7+IWXZTegefC67/N
	E/QJHtoj2NfCTnSPqKrQ4Rhxl2Qj9reVbaIjs4YyH3s0XrI3LcZV81QT
X-Gm-Gg: AfdE7ckEWC0N9/ExS0mWOmKKRaCZGWhF0zQWR4tvIl7ObESHC+tltxNEnspAtwy5Z0Q
	FA1mj+8ANCI604LaRRwok4IyHDYQnQGWVy+g4cSYJ8jHqvySeD2k6DVQtjpYb3305H9sFKioSKk
	5jv3uu921Abiyi0qZ1OMlpbawFUod+S7DG8A75sP6CoDcIxa3uJIfaZECQ74ycoEg25OlD1ueQi
	NyY/8gb1IhiOvuOrqvHeU/vpWPofoQL2ZDEDysCdCGT+KmguawrT2dfXraAeYcATw0QcItasa0g
	77TOJUsY0dIHNewOXz6l8xgccKBwkqccdEdCQJpC/U8jRPP/S6vRDXLtyA34/3a8t9ACYEcdbVW
	SaEaJpTYQ3cJEJjR5fOv0Pvapy75cZPqKQ9ptWFlYPvtJvlneX9rR0sdFOANUfMk1ej4pvx5Gb2
	WzECi1rTsZA6zhMOBci1GaprJw3kunk+obDYgX3oUddKZz2NGkeZFavXvNbY3rQOStx9NaIoUJY
	v+P7Cm/0nAyfxlucRg+3zFIieMDU7DFbwrXW45XdeEm2QSd2bAN8we1j6GIm6P8K7830Tsjt3g8
	bh7mGNeBc78H7w==
X-Received: by 2002:ac8:58c2:0:b0:516:dff5:68c4 with SMTP id d75a77b69052e-519f01a35a9mr72705831cf.7.1781926953853;
        Fri, 19 Jun 2026 20:42:33 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a0984da98sm12030121cf.15.2026.06.19.20.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 20:42:33 -0700 (PDT)
Message-ID: <6a360c29.883ba7c5.96128.ac08@mx.google.com>
Date: Fri, 19 Jun 2026 20:42:33 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com, meta-virtualization@lists.yoctoproject.org
Cc: vkraleti@qti.qualcomm.com, anujmitt@qti.qualcomm.com,
 sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v2 0/2] Add crosvm recipe to meta-virtualization
In-Reply-To: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Jun 2026 03:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9894

Thanks for the v2! Most of my v4 feedback is addressed — gitsm dropped in
favour of explicit clones, PV/PKGV cleaned up, SUMMARY expanded, README +
test instructions added, and the qemux86-64 nested-KVM path gives me
something I can actually reproduce here. Appreciated.

But for a v3, make sure to summarize the changes from the previous
version. I had to look up the old comments and that gets a bit tedious
when doing a lot of reviews.

Per-patch comments are on the individual messages. The main one is on
1/2 — a one-character SRC_URI change that lets the whole
do_filter_minijail_cargo_config task go away. 2/2 just has a typo and
a small nit.

With those addressed, and a reply on the three v4 items I still don't
see resolved (BBCLASSEXTEND, wayland, crate-licence variation — replies
on-list are fine for the latter two, no need to be code changes), I
think we're close to a mergeable v3.

Bruce

