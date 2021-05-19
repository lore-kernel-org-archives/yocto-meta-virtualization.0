Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.10526.1621427052203640012
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 May 2021 05:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uNTk7P9D;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id p24so18430524ejb.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 05:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NlyU+7FBzJ1gFrdFCZp+lAim1x23hGTYi1L8hV7lmYE=;
        b=uNTk7P9DP8Mcp7IbC7iMnZKivIolpGmLa1kQqJx4hFmDdQlczphhwtNZp1zBN+UG/V
         WyDHC2lrcqkhb3VMtHQtTmtEkhF9neUBFDjGUkMVd6KqcN7o7GL61tFOBDND08MHw2sW
         EptCgyvanGNcivS4CUp1P7rXXB+ykOaIega9Vvw/HJ0Q3xV1zLXXrzn2RZJCfvuKgB9M
         QoiGQHiHLuDm6/oC8AFkJw0fhYxAoOCOwFAAO+bfE9J/nQF9A1uZIN1QcUZwzs2Zi0WJ
         T+lzKbHEexiV5HboaGIzYXf8OvN15m/u735lCVGxv44lx8WpM4ZkAqELCMDzqQNLoLrS
         /NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NlyU+7FBzJ1gFrdFCZp+lAim1x23hGTYi1L8hV7lmYE=;
        b=Hzh8RBuiYnZ3B2CjdxvXWWOl5H5l99fNxcMJaRDiQwCeOsoz1GGxpguHP3boLGhRqo
         UUILkTIo/eZRj+mD/gfd5amawgcAp2MzXpItJQYacPgPVtIoXfp1g0sW51HBIN5X1t6P
         Nl6DRLHg5Tp/t1erWr5uFXP3zgwFt0jDSXYGGpU8XCLiU4gIb4IrCrY/NkcJlcXeWWdX
         aj5it/OffQWDdqoWC1wP0kNdlBhNl+KQkmRbhCIqKlmFsb3dXHpxSfgss9w03tyPC8Qh
         7RixgIFkTPb3/rcoeOcnxBs4BMTY3R5xHoDW6CnpxHYrwJ6nl/+nKmquBxd3tIa+fJ7/
         vgcQ==
X-Gm-Message-State: AOAM533pnbIXAAIee/2rFmgCEMzBWAQLBLDHMfM59A8+qxVuUZrvTv4g
	+eeXzTK/xIyqUgB1pD+arcctfA5xkPwnjDMfV+M=
X-Google-Smtp-Source: ABdhPJzLdNlf0XAWfjWAGBuAa5Mbr+8d7/aA0mJw8t4weh/qWcK3slAQI4pDVa9qPQdpkwneyQBov2qjzM2caf8wFEg=
X-Received: by 2002:a17:906:1444:: with SMTP id q4mr12444054ejc.459.1621427050553;
 Wed, 19 May 2021 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <y1Mg.1621426709451334377.jzDQ@lists.yoctoproject.org>
In-Reply-To: <y1Mg.1621426709451334377.jzDQ@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 19 May 2021 08:23:59 -0400
Message-ID: <CADkTA4Otz9OpuyfXLMj818aW8=29ycsNk9Baz1UHaZ-xVbG=jg@mail.gmail.com>
Subject: Re: [meta-virtualization] crun fetching problems #meta-virtualization
To: camorga1@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 8:18 AM <camorga1@gmail.com> wrote:
>
> Hi,
>
> I have recently had some problems fetching crun in my project. After som=
e debugging time today, I noticed that the problem was specifically libocis=
pec and the fact that they have renamed their only branch from master to ma=
in (https://github.com/containers/libocispec/commit/e9d10a610d95a3acd771307=
2410a2904f265d0c2) on the 15-05-21.
> I have a fix and I'll send it as soon as I have it ready. However, I'm a=
 first-time contributor here and I need to figure out the whole mechanism. =
Since the issue is sort of critical (IMHO), please feel free to go ahead an=
d submit a patch before I get mine ready.

We've been dealing with a few of these lately, I'll do a quick fix on it n=
ow

Cheers,

Bruce

>
> BR,
> Carlos
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
