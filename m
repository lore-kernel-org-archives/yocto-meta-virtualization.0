Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.17720.1593595388355490059
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 02:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@gmail.com header.s=20161025 header.b=J33EuAyD;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id d16so12322706edz.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jul 2020 02:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y65pqPMG5Sf7aj/HgrVuvbkjHdi+45mViZEubKxGfUw=;
        b=XM8jSlJCOCjP0ujqHA8QAFByMrsjS1ljf9GVc6dlR3QI/ZCTj5Vu8o9BvZmMWy2QeW
         qBBgb0csS6AMcjI6IpMLkwnWLdnQma6ArkfGav/1PN6JyM9dRB3zu5GJO/ro3SBIdVHs
         caMFlqRN8fc5RIYov13v3V5WPxT6cL4MRwW1B9UChWoesJ359XjP3KEAHNFG1uba5aWo
         qdun1FXdoQWX0+GUsvnk2T884Z1ScYi/GVA/3fL65U/du9AqDhpY1na7H2xD6jKsUOTl
         muYZOlJ/efa3K+Lxb4H1TktOZQo04wQrlFV6VmP+4uRSvbZ3g3h/bFrE/0NhO2P2i9iU
         YlYA==
X-Gm-Message-State: AOAM531PLD9WTEie0Oc7VuhY8/8IQodxTb60jAbd2GRBVM9tNZUhIOQT
	uMjL9TqzYEM0S40iq5JB0k6oTpn6
X-Google-Smtp-Source: ABdhPJyuGRPLLKCKZbRU3NeGVOLsnxkD5xPktskjNMOG8ejI/hf0P2jYBZLBVNHdAr+Bk6AR0ya0lQ==
X-Received: by 2002:aa7:c504:: with SMTP id o4mr27255355edq.311.1593595386628;
        Wed, 01 Jul 2020 02:23:06 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o14sm4209027eja.121.2020.07.01.02.23.06
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:23:06 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Bruce Ashfield <bruce.ashfield@gmail.com>
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 1 Jul 2020 11:23:05 +0200
Resent-Message-ID: <20200701092305.xbrkqviurk53ob27@jama>
Resent-To: meta-virtualization@lists.yoctoproject.org
Received: by 2002:aa7:c143:0:0:0:0:0 with SMTP id r3csp1723813edp;
        Mon, 29 Jun 2020 05:30:17 -0700 (PDT)
X-Received: by 2002:a05:6402:158d:: with SMTP id c13mr17679411edv.103.1593433817251;
        Mon, 29 Jun 2020 05:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593433817; cv=none;
        d=google.com; s=arc-20160816;
        b=BgUlvXaWHtK4zLx9b+itA07NHM3JlTvvqHADQBEj0RXAJA4BwQLBFOyIves9G/9YLU
         bp/61V5PcJBrqOlGXWWcFrh4CYNItZBIf3FsfBxL0rFZCqFdTIhKuXKFLKjSFqh1tUZz
         HXIdJ6tn/NLnadmOoCI987/Vt0MXpNMsWbpghAH1DJfsnoUGTRvgIuoZ7C39a3doH8/4
         gXJgKQYBFrarKw3plzd6xvsJ216XuHynUw6iwVjswbPJWV8qYwc6x03AI5JnDEjAru2P
         iZyvVXHxUR7fHg6erzhfLUtFZhS2kLUAoyg9RSB31UuDmnnRLf7Of5myHlwgByqhmr5J
         12yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y65pqPMG5Sf7aj/HgrVuvbkjHdi+45mViZEubKxGfUw=;
        b=RzfEdSwk0yI5yAT0uvpo4mQKJ03Syj8b4iU6AuocR/JeB8YCAc896eK+gHDNVVmg9K
         DZ672dOMQVCNvp/ljgK3UfQ1AmP06IlSGMutYq3j/Bi2TeRfWOAueA4huNXf5zDOY1bL
         Gzb9MlXL6f+7yZ7g7riiFL26bFlj+vOvmAkqxluENq3Eb6cDMxyBFp2PRiTGZAGrcN3i
         YJJdZNQQM4XM0Z3YYEBW/bRYINO0AgqYiTsbzR4s1PZqSflCtA7oQRkBc7LsWaumjTVP
         N4J2iM36mFtRRmXRa/W5yd2nNmKQX5sllcbbAmSLfHm4FCVH31WLsIiv+twQEul7z9a9
         zyLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J33EuAyD;
       spf=pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bruce.ashfield@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id cw2sor26461650edb.5.2020.06.29.05.30.17
        (Google Transport Security);
        Mon, 29 Jun 2020 05:30:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y65pqPMG5Sf7aj/HgrVuvbkjHdi+45mViZEubKxGfUw=;
        b=J33EuAyDtT1kBRRs3DOxez5pj9HGDABNSaZ/JgJeD7DCn9rgFBh2lTV+KBjF/iTcL3
         fwwNeuV4riO+bC7K5BHdra1EiJrTRORYk2a5MYIxvyB4WncqzCjVF3+Z8Q5GA/E4C4+F
         plOr4EVGAdEvhg6v2oYQfV/faudnMiUXmGZP034orwXt9sgrKUpRAIEOTPQ1yvsYnZQ0
         ERCTJW84LBhPKARhjsDMCFVzHcafZCluchx7aFVPyFsPwzGsikgmpZxRkPI/Us3ZkPyE
         qQTSrO05Rr3cUyFMRPF9OMo+wW7Xs3LQNd7Mgjw0VIbJrU+ylU9GIji5DdsKsPot/7b/
         7lgg==
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr16971994edr.164.1593433816899;
 Mon, 29 Jun 2020 05:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200626161705.32600-1-liu.ming50@gmail.com> <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
 <161C28A10F0C0173.4849@lists.yoctoproject.org> <CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
 <CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
 <161C29D35303F5F1.8018@lists.yoctoproject.org> <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
 <CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
 <CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com> <619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com>
In-Reply-To: <619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com>
Date: Mon, 29 Jun 2020 08:30:05 -0400
Message-ID: <CADkTA4PDkvqZcktkx1+RY--zV5JWK1WmspuJdWQ_js+jjuOVRA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
To: Ross Burton <Ross.Burton@arm.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Ming Liu <liu.ming50@gmail.com>, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
X-TUID: 3ZveNtK147Rc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 4:38 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 29/06/2020, 03:48, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
> >     Indeed that was the thing I was missing.
> >
> >     I've reproduced the error, and it is where I thought it was. I'll p=
oke
> >     away at a fix while I listen to ELC during the day on Monday.
>
> Thanks Bruce.  Did I break anything, or did I just expose historical brea=
kage?

As far as I can tell, a bit of both :D

It shouldn't have broken it, but yet it did, without mass breakage
everywhere else .. which means there's something funky with the
structure of the recipes in meta-virt.

Bruce

>
> Cheers,
> Ross
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
