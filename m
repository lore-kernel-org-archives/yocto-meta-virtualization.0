Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D8FC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 01:45:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2886.1783475097364941696
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 18:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZGHPrcMT;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca1328b8584so81420a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jul 2026 18:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783475097; cv=none;
        d=google.com; s=arc-20260327;
        b=sRNS9C9uc33hrhsJ6NK8X5AqMlsBQuxUaJTDpAExeW3gEF10EpJy7oLWJX6bZzQU4E
         q4nmvv0NU9tdt7ft0njWe5yLQE8Awes6lGx92EBoZy/gvsnV1u2F41Uq1mfHMHeuGc49
         oruc4/ZXAhFujPBapFrPy9hcytGjcaEt5r4NPszpsklgjlPE2PGb9yHqpxkL2EiHRtc0
         h68aPNQGSVu/pzF1eFBxFXslv0IJSq19txJPo1Su63d9eE7cYcrfq7mMsW8F/1iklDWL
         DtDRetNSBP4GVDhgPUG2yznesrKSqmLF4nGOJ+4LjgWPGXuWlDrkWf2EP4n0dn5Iwfn7
         wWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bm5P4lXb8s3czW750+NTqGEDPG6CWw7noh6JaDpzYlc=;
        fh=l2uPt/2QMgY+Cl+zbSNmjiMlwWWRKMqZemrgrARESUI=;
        b=aPkNNOK0sEgKVilETkSjccn+c24GXjHIG869jGOqbEi7P0DGGPgzSKXdFUOihMH0IU
         AnR1AWmG16FKGMSXdBZ1sn/S2GM4NBxMNzJ0v0psoDRG1mzwpMYiBRckK1+hgGvL0gUn
         QDt8vOo+uNBFIX9Lcj54r/AKNNLJ1XxVPeX9ghb84aBCholIcLH24m2vgg26fsTKHIAV
         SWUaYZAqAzra0//DfduJxbW8/lMV5v7iKfVasaiXHBpptXhpxrc3hnKRvvCKp7owOsgp
         TRb3/VMk70r1IYalkJNT6MiPylpMpVrQpXrIR/gr0rHuFf4kMOEpAt2EutWvGwE58uTM
         Ex9A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783475097; x=1784079897; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bm5P4lXb8s3czW750+NTqGEDPG6CWw7noh6JaDpzYlc=;
        b=ZGHPrcMTuq+xWe6Q0ZF6ed9RsFDGFrWrJcyWJju6OwvP/+giiiEbMEqYXRGJJjeEkX
         E3SZnx1/ey9J3Uhd93rUJ0UI6k7/pibAZMsKBCFBrkLZiv/PLiqyhFtoQZ2kD2921LQn
         4Q8+lGtqwd0I2OXD9FQrADosjyoAay/WOnK+RKIxb3MmxyJSR3Hs30ycHQEYURi6ORWX
         l39naJ/yaeT5hTtQbDx18nOm8nyct0jIirccwML67Z4AKSKBfD0ECwOXC4ALHcBnM699
         3OtkkJjaCKNoTonwWDeUk+rECtOYSPdilCD4qXMKQL3gshJq0pp/JjIEAlBLgwQlZyqu
         ICbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783475097; x=1784079897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bm5P4lXb8s3czW750+NTqGEDPG6CWw7noh6JaDpzYlc=;
        b=ENgKaXquCtq2kfWTJPgQDhaaxA/gHfzjkigy9anAxSkM53jJ+3T9yZrq+BWRGzoMLz
         LaPWZSZu3syfxz1VoabJSxkAsUXWiEijLvRqk2hxbSIDp1pvUGTSm7v/15UUwbjJC17F
         bVZ7tSrjowsSljjWDela9bxvmAq/8sYBfFDhbO71VQMhMmUkqO7EgR58dN47EfprSU/g
         /ypfDz0676OYUe5X1sGh0oTmhnI0DZpC2jITRhCTjMvVWwk3/xiT8XUNKQLlndo9Ob4v
         x37gsM9QllZSt1aHSvV+uaTaXicvcUd6pDHSO3oUS7joVShF+hnyTGxGYuuRRvwd0eWj
         yBeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxfUKE67wpk8fQhLFMVF00qqsM5AOlFvna0NedJVrlCSFFs1Oh2ZiZkHAzX5rg2nyZ6naIuOED3862CPF9gM1cooKA@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyX53hPjAg/BP1AigNwCWOpQ8Of+uASTwMBNTr7HsGV7AGHfGSn
	xfJyTVkYPRUzLCtDkRLoJPylQC18JlStgkZ90UwE95bLhIjB9/lfGZtUzeTq0xFIne9Iao/z5tg
	Qf3ifllmGeE52U7lD36LmBelh8k6YQ4U=
X-Gm-Gg: AfdE7cnyQ4cXrPtdMfIEDfkEojehHVkwZnOJGRRjmnBwZ+1x6fp58qDM8+Ze97367Se
	14r9XHfiKMhKvBuD3kflt9YpsRiYicWwFYLioO062HnpPISphqPLdMoTWyOqc9nuO79Bybk2Ypc
	xWmAcAf2jyqWldz9fONLio1LTB/TtsQ4MfPZd/NSsFNUsEpOEPbs8+pUZUMpIDBOmkQs94LGnMB
	zXW9v4Wc61ncOhDWqKAabMJsMq2bw+SM+fP/YGKbiI8G0uODM82f7E/yw1na6hKI8CYRfjA4AUF
	UdZg4AEVYFA8Ivxhx32O3XxHOwbOHd+H+G2S1GMlD6MVHP9NUCLaqGVLhRro5RmHZBvKrdYIjhR
	yo8ABNOEn/cJzimI=
X-Received: by 2002:a05:6a21:4a81:b0:3bd:187e:2d4 with SMTP id
 adf61e73a8af0-3c0bcbc9d79mr260506637.41.1783475096687; Tue, 07 Jul 2026
 18:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
In-Reply-To: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Jul 2026 21:44:45 -0400
X-Gm-Features: AVVi8CcdIiMMHKwkisV24rLg_-xhgfvcBZvXQCqUM0OyuJEiJCWqIAuV5YBrIFU
Message-ID: <CADkTA4M3Up8ynA0nmFbeYy0SRTnekKUva_b9tfZV+YVZePF7ug@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add crosvm recipe to meta-virtualization
To: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Cc: anujmitt@qti.qualcomm.com, vkraleti@qti.qualcomm.com, 
	sbanerje@qti.qualcomm.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2026 01:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9944

Just ack'ing the new version.

I'm going to be out of the office starting on Thursday for the two
days of this week, and all of next.

So it will likely be after that before I get back to you.

Bruce

On Tue, Jul 7, 2026 at 9:23=E2=80=AFAM Keerthivasan Raghavan
<kraghava@qti.qualcomm.com> wrote:
>
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
> using seccomp filters and Linux namespaces. This =E2=80=9Cprocess-per-dev=
ice=E2=80=9D
> layout shrinks the trusted computing base and prevents a compromise in on=
e
> device model from affecting the rest of the system. These isolation
> boundaries align closely with secure-by-design principles and provide a
> more predictable attack surface.
>
> For embedded, edge, and containerized environments=E2=80=94where minimali=
sm,
> stability, and strict isolation are essential=E2=80=94crosvm offers a com=
pelling
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
>  recipes-extended/crosvm/crosvm-crates.inc     | 966 ++++++++++++++++++
>  recipes-extended/crosvm/crosvm_0.1.0.bb       |  61 ++
>  recipes-extended/images/README-crosvm.md      |  68 ++
>  .../images/crosvm-image-minimal.bb            |  80 ++
>  4 files changed, 1175 insertions(+)
>  create mode 100644 recipes-extended/crosvm/crosvm-crates.inc
>  create mode 100644 recipes-extended/crosvm/crosvm_0.1.0.bb
>  create mode 100644 recipes-extended/images/README-crosvm.md
>  create mode 100644 recipes-extended/images/crosvm-image-minimal.bb
>
> --
> 2.34.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

