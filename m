Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88822CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 19:32:03 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78290.1781292715909857440
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 12:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j6aIi4A7;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8d18de80b29so18187776d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781292715; x=1781897515; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLAD8QIFTxqaAapJDJtC3garrpIT5sSbB5hnbkS0Ri0=;
        b=j6aIi4A79lA/8gEwV+7aM95vEsiRCq1ooQcCip+vv+zjYBsW81hF9C++/uQD0RRfDi
         1G9FIQpnm/4Yf9pJXWXsuGzOJXIFTZrEz/7cyk3huvAs/O62gqv9y60tQSA42HBDzDnc
         3c7aKy16l4geHlmeNhBweqVe0cHeZhstCDjao8RGotsSmtfqH+Afi3VFaxqpdrPiHal0
         qDpviz0At/aGtNT2vEvM0zCLKd7q1FGadWo6nF7e/eUstVCcr73I4OZQEL/CzibULaBF
         WHa0evj7M/47Wt+EOtmEEme4Ovovyl9CmfQs1Lt8EZBi2jZhq40gctcRoAZy1HqmR5il
         CInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292715; x=1781897515;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLAD8QIFTxqaAapJDJtC3garrpIT5sSbB5hnbkS0Ri0=;
        b=axPP3GvZFhOdMU+W8YSP3ytMGDS1wu3A74Jz/7UFjs7f0/MDgZMtkQ6HQ2ueki6CSp
         wVVgsn4YSByWdPyXtWIqKKyc0HMo6wiRf9Bfsnmr3Xv0inVSEwNS1Dnxa9Oap2ZH5N9K
         1UYq3lKzHXxs4hpoViBIwP1PuAcblaAjT+3/2s8qP9j2N+3qcFLuQxGhdGOAFQ46U3s7
         tTEb00BOVWoC3+CnxJ3CYyzEZArEO2mHfQxXdXEodLpB1avnwD6p6g1KBOf1qGXiLhok
         rFea96jXiqftN6YRG5p0xDt5SIdgyxp4oiWGG2TOapRafaIqO3hmA6aeFxx+KjiSmegJ
         +68w==
X-Gm-Message-State: AOJu0YwavW5iiGTogBz3iLSFP0CLi2v+OMeqlnrYZPyGjh6YIvGgBRf6
	usMoRvdyftGnBYnItqs6GtKbI+96l4WeKkRsnMnxqlRRoYmHh8CNNUGb
X-Gm-Gg: Acq92OEBkUFLSvvJ4evn3VuIQ9sSfHaTRsC5YhnqpEK6iVjkW+GuWwML15fkfV7s5zb
	oiJBZNRYi3L9ELpt5PsLEL++190+S+2TjANKiVRZ8QPdn/n4ZBYivSiUmdtaSgvEHvcmwdKUExx
	pl3Heu7ORnbDlC1cVHYg4qv9qstalBBhQ8dYtL/7z71r7KH+ZB2Z1v6jMGt9fNaDywBnngKkr3Q
	fa3Pyfuo/RbZEFMuOCPBsI9pZLyX1EYpCVEOHePIpFyR/OtuIUzkoJV8hil+yPfaNy+RKnV1zLt
	xCeoWSfpFKxnp+AW4w9BsOITRPdhT34W/i9ah2t4Xdg1Qe4TjtCHbNdQ61a+OYCMgLr6/3UBktC
	R48mY2goqz+n/LZxzUTJVtQzrNUccCY0v8S9GfrT/aHZGoMNVw97HAV9oGI5sxvcV/62CnN2Ndp
	rWo/fpsQxZBm9uVIfPgSRiVgellJZoqSyiWKSjI/dBX7AjD15zCyfqxeZVNUB/ImIuMAtqIn9l8
	zE3W2bpl57ckp7SQ0j3bcxI2E/z9GB3M7fHgovGMlaHPun06NbixzmQVv3Y1Di83MJOEwYHJiHJ
	b18Bji8ipzME5u7i8oZBmi91UAkHbhoMk/k=
X-Received: by 2002:a0c:f099:0:b0:8cb:fd1a:c87e with SMTP id 6a1803df08f44-8d3140df1fcmr69519466d6.1.1781292714758;
        Fri, 12 Jun 2026 12:31:54 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d304578816sm31426716d6.23.2026.06.12.12.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:31:54 -0700 (PDT)
Message-ID: <6a2c5eaa.f37b3156.18fa4a.5ad8@mx.google.com>
Date: Fri, 12 Jun 2026 12:31:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org, vkraleti@qti.qualcomm.com,
 anujmitt@qti.qualcomm.com, sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v5 0/2] Add crosvm recipe to meta-virtualization
In-Reply-To: <20260527191012.1125228-1-kraghava@qti.qualcomm.com>
References: <20260527191012.1125228-1-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 19:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9880

Hi Keerthivasan,

Quick caveat before the per-patch reviews land: I see from the list
traffic that you sent a v1 series, but I can't find it in my inbox.
So my comments on 1/2 and 2/2 (sent separately as replies under
those messages) are based on v5. If anything I raise has already
been addressed in v1, please just say so and I'll move on from
those specific items.

Bruce

On Thu, May 28, 2026 at 00:40 +0530, Keerthivasan Raghavan wrote:
> This patch series introduces support for crosvm, the ChromeOS Virtual
> Machine Monitor, into the meta-virtualization layer. The goal is to
> provide a modern, security-oriented alternative to QEMU for
> virtualization workloads.
> 
> QEMU continues to be the industry-standard VMM, offering extensive device
> models, multi-architecture emulation, and a highly flexible subsystem
> architecture. However, QEMU's strength and breadth contributes to a
> large and complex monolithic codebase. As documented in QEMU's own
> security guidance, the system architecture places numerous components
> within a single process. This increases the trusted computing base and
> expands the range of possible exploit surfaces. Maintaining device models
> and legacy emulation paths further adds to complexity and potential
> vulnerability exposure.
> 
> crosvm approaches virtualization from a different perspective. Its design
> principles center on minimalism, isolation, and security. Instead of
> supporting full-system emulation, crosvm relies exclusively on KVM for
> hardware-assisted virtualization. It is implemented in Rust, enabling
> strong memory safety guarantees and eliminating many classes of bugs that
> commonly arise in large C codebases.
> 
> A key architectural distinction is crosvm's process separation model.
> Each device backend is offloaded into its own tightly sandboxed process
> using seccomp filters and Linux namespaces. This “process-per-device”
> layout shrinks the trusted computing base and prevents a compromise in one
> device model from affecting the rest of the system. These isolation
> boundaries align closely with secure-by-design principles and provide a
> more predictable attack surface.
> 
> For embedded, edge, and containerized environments—where minimalism,
> stability, and strict isolation are essential—crosvm offers a compelling
> VMM alternative. By integrating crosvm into meta-virtualization, we allow
> Yocto users to choose between a feature-rich, broad-emulation platform
> (QEMU) and a streamlined, security-hardened VMM (crosvm) best suited for
> KVM-first workloads.
> 
> Patches follow.
> 
> Keerthivasan Raghavan (2):
>   crosvm: add recipe for ChromeOS Virtual Machine Monitor (VMM)
>   crosvm-image-minimal: add a reference image for crosvm demo
> 
>  recipes-devtools/crosvm/crosvm-crates.inc     | 966 ++++++++++++++++++
>  recipes-devtools/crosvm/crosvm_0.1.0.bb       |  57 ++
>  recipes-extended/images/README-crosvm.md      |  68 ++
>  .../images/crosvm-image-minimal.bb            |  68 ++
>  4 files changed, 1159 insertions(+)
>  create mode 100644 recipes-devtools/crosvm/crosvm-crates.inc
>  create mode 100644 recipes-devtools/crosvm/crosvm_0.1.0.bb
>  create mode 100644 recipes-extended/images/README-crosvm.md
>  create mode 100644 recipes-extended/images/crosvm-image-minimal.bb
> 

