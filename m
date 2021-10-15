Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.9353.1634304842967931549
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 06:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jA0+D9Uy;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id w14so38029722edv.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Oct 2021 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y2jFfpilKEh1fnOuOPPa1uG4HYS37G5d9GPBpTIB1yI=;
        b=jA0+D9UyDedTKGpv/8ULcuKTceIP2RxtDpwqlRKnrk1PBGQD6v4TbcMXJX3V2wzY2u
         h2eR8nPzJvprjT5+gSU+5bsSH7x8nlaBv6HXE4MqvEMq20S5x5wDqTF7o2VkgbUAdoNE
         ct0/5oqrZdmaUmjT1Hy5m/yCUU9xK7dp+rne/WQMSCSr/efgvuLNpr/FBds3OXPPfJtU
         Ti8MN0x2bqU2C/9ZrPH1dLy+B0rJ321XXN7RMK0z9/TycAT1Xbs7e8Hl2UUpmGPyUp6l
         NhAqwwD9oX2FDH6pUGokBjBCL+UXmZYIWiwwX5dFdBS6cMewlEh/TpLWzw0i4ZdDf+dY
         PQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y2jFfpilKEh1fnOuOPPa1uG4HYS37G5d9GPBpTIB1yI=;
        b=CpQNQ/kSseLKu8jpgaCoLSrE4T7ByPAyaJ0xLUiu9vEEUaenhCf+hVwJrvRaWyBFRJ
         e1KTCSec8AFydi590ymOhH+IDxcO4Ce3fT+p/wvsfwPantMiX20tq6QHDrLQnINWjzYZ
         6hDnljAyf9ufIAUQ8rxNh1w8VJ4SDYDOWT2gwpAL/ZjBcCHpnPWKs7PVH/QEbcIGQ5GK
         Z4kZBHUlSCHgmw7G0FoKtwtdiOGdGfJxgfZ2+sITMky5+PtIIt1QAHwWd5P0oys5PgSG
         DKLsFyl3qURlwdFajYKrHqV4kRVZYc5AzqqNATQ6tNyyfzL57NrgaEfq2lAliVxK/YpC
         6Znw==
X-Gm-Message-State: AOAM532GP4HT5g78cEI/sKHSqJdBTNiOAaoWdIpbOaW+SFuVnh1PtdCR
	ed28nUwmyZY/DKyx/WXMnuHOzkD/Ngg7IfHpUus=
X-Google-Smtp-Source: ABdhPJwHFu1Er5eRcBkjJg+auA57oOhohe1TBx0AiDzGQBxKIpuDdNVKg0QE6aj2xDF9FvLcfwdbEiqTbsV67bNdqKI=
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr6960191eja.379.1634304834149;
 Fri, 15 Oct 2021 06:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <ad014c7cc4e8d1bcd4f499229d09e013@denx.de> <8227d089c2ea3916874c0818ef882fa1@denx.de>
In-Reply-To: <8227d089c2ea3916874c0818ef882fa1@denx.de>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 15 Oct 2021 09:33:42 -0400
Message-ID: <CADkTA4Oz_97+2kyOoP4YtH__bHCK+9hwGZCPXyEvgyM5eoehtw@mail.gmail.com>
Subject: Re: ip6tables executable not getting installed in dunfell
To: Fabio Estevam <festevam@denx.de>
Cc: Nathan Dunne <Nathan.Dunne@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 8:49 AM Fabio Estevam <festevam@denx.de> wrote:
>
> On 15/10/2021 01:40, Fabio Estevam wrote:
> > Hi,
> >
> > I am running the dunfell branch and I notice
> > that ip6tables is not getting installed:
>
> After passing 'ipv6' into DISTRO_FEATURES, ip6tables gets installed.
>

ipv6 is always in my distro features, so I didn't notice that myself.
I've added ipv6 to the required distros check of podman, so it will be
caught in the future.

Bruce

> ~# podman run hello-world
> ....
> [  207.201607] cni-podman0: port 1(veth6b661354) entered disabled state
> Error: systemd cgroup flag passed, but systemd support for managing
> cgroups is not available: OCI runtime error
>
> Does anyone know how to add systemd support for managing cgroups?
>
> Thanks,
>
> Fabio Estevam
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email:
> festevam@denx.de



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
