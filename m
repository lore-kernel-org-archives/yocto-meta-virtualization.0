Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.17726.1593595402579860230
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 02:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@gmail.com header.s=20161025 header.b=RJ5pMc6h;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id l12so23744856ejn.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jul 2020 02:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GmT7UXffT//OvgXwKhYEDGRyKbYGlEohTgbAq0LtAgg=;
        b=Ysrqiy+TOtps5WN9rVrtfKkQXm5KN8Zq/l7CYifDsKGzCT9y8v21PuctH1VhuFNuYf
         gQayQhFWnBY6p/cPZT2WBPH+Hv+82H6IhdI+q18QLtVEBcasdFQsWWxxnboUPsK3Wz25
         AmFpPtUx/13NOYvWxuAvS+FC+kJ4ZxvUohGmaUe/8wL5TQw7nxam0lAtn63G/psd35Tt
         p9H8ePxb6lanDP0tytFEp2MV2RR+7Tb1aH+J8eyu4OrfYSnHaXc+9XOvscgGv6dMEPfX
         spfYcl2yJT7kdCaf4wdpAK/OKCJlM74RVca1CmpVadeQVAQP4cpjW19w393s5SFyAwa4
         GGEQ==
X-Gm-Message-State: AOAM533/O8HwbuqwepuM7r+uJWelKr6yfOH9A5VVd5o9K6RwrMWod7ou
	iMesPtv81tEWZuZf4+EBIge+wfKp
X-Google-Smtp-Source: ABdhPJzbhHw+vajk80vYx6SVL8UmQZenMJ4pAzyIwVToR2gAKdxESjf5zEbDUzTSKMNqbbWbM9snww==
X-Received: by 2002:a17:906:6606:: with SMTP id b6mr23206879ejp.102.1593595400962;
        Wed, 01 Jul 2020 02:23:20 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t2sm5546343eds.60.2020.07.01.02.23.20
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:23:20 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Bruce Ashfield <bruce.ashfield@gmail.com>
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 1 Jul 2020 11:23:20 +0200
Resent-Message-ID: <20200701092320.xlmgwlyck4xz52n3@jama>
Resent-To: meta-virtualization@lists.yoctoproject.org
Received: by 2002:aa7:c143:0:0:0:0:0 with SMTP id r3csp3030843edp;
        Tue, 30 Jun 2020 13:31:11 -0700 (PDT)
X-Received: by 2002:a17:906:494a:: with SMTP id f10mr20731677ejt.428.1593548703363;
        Tue, 30 Jun 2020 13:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593548703; cv=none;
        d=google.com; s=arc-20160816;
        b=C7gyDw0irKEQ9bBsY/+KU9vdMdWr6pUNX0ZHQTqz5JXNH73rgho5UdiovFlbgZPZ+/
         4u283XHeRXoADMOZU3h3wlAV2covwy/Efulz5V/SO6TFxMPrFu3uHiLidEDSKFS8CqlJ
         1+1K8F4m9NFIWxeFhUa63IF90CWo+zE7d+9PCIasr3WF7rZXzRdXBdfixlmn0kV3a7kL
         LdkZ9b89VDQcv1sKZy6Urweqq5yMpIAqmcaYigVhIssCUNk/HTiS1j+5jqSc65C5gLT4
         hH/Q0+gPXEytDpqfZA675ONwNyhXk0djitqcupOkRUZGxcKDhTUSlsSAHGl3umSseNpa
         e7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmT7UXffT//OvgXwKhYEDGRyKbYGlEohTgbAq0LtAgg=;
        b=l0g6EbgOSpRmuAhsNlf0ScH+wJ5/9XDIiiMIAUBtKTY5oUnvTaJ+PPDnkyIkVksXyr
         IHeYg2i5HP6t14wdyLMnEQmwfPCaN+STJ7MI4Nw+RzejNDWx4/05HNJa+GkeNIKU9o64
         WuiIkeA/98F5abQXcEoXF7uI8cnZXYA6FkCtVgmU84/yhOiDMLs1MXnfQZY5cktxrMAZ
         slhZ0bxk0jlm8HaxAGqj7oepzjVlfPZqRaDshWDe376xLSxhYZhrJVVC9EyNJaJn+tHy
         wP/Jzn3cv8Yd5ujyWBXntWo/g2Z9XQHT+sB69UkySv4TPbIaQuBB5nW9jDuo5VFJ62Qr
         H6gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RJ5pMc6h;
       spf=pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bruce.ashfield@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n8sor4584700edq.18.2020.06.30.13.25.02
        (Google Transport Security);
        Tue, 30 Jun 2020 13:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GmT7UXffT//OvgXwKhYEDGRyKbYGlEohTgbAq0LtAgg=;
        b=RJ5pMc6h/bIWOEZy/px92iyOJjveBX9XvBriLxUOGG3t4TbO/lz1q839GnBZYV2lhN
         /s4JaIbCYUfwmfQqzLUK+lQdlNoayRh7iiW0ZVnc3glnSDSPHOBl3QvZVs3zYEKS1PcZ
         /AWe1sWd5OzZI/P5++eJ1NtNa6dLiJkiBuUK0aYAQsIhrKUn9PkvEBWOcsOaGcAYLfQ+
         fabLalUDgs3gmjO/NyyIjU5gc98Du3O6UW8oK8q/8aUwWZ4j7H9rkjZol9HLVEAh5g3k
         dpu2iC+aPGOKdqDYC/p5VhzXcUSmERV62Eq3sAZun/+0lIazfzwY+KJUWo2pUeIMwogH
         Os/g==
X-Received: by 2002:a50:f385:: with SMTP id g5mr24132166edm.347.1593548702298;
 Tue, 30 Jun 2020 13:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200626161705.32600-1-liu.ming50@gmail.com> <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
 <161C28A10F0C0173.4849@lists.yoctoproject.org> <CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
 <CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
 <161C29D35303F5F1.8018@lists.yoctoproject.org> <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
 <CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
 <CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com>
 <619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com> <CADkTA4PDkvqZcktkx1+RY--zV5JWK1WmspuJdWQ_js+jjuOVRA@mail.gmail.com>
 <CADkTA4M7kUqBGW52YWSK4+gQoH7n5P1Rdwd3RRENJXv_2YiVtA@mail.gmail.com>
 <CA+chaQdAqpF=uOCdnXVqUghMRtNj9NtweLf+NwPZG5vaq+PfLw@mail.gmail.com>
 <CADkTA4OxzRm6siKyqxxqdHSF+gwrQfcG-g3cYWCVYBezgvubQg@mail.gmail.com> <ABA1710E-FD64-4F28-82D4-EC375EB1EA31@arm.com>
In-Reply-To: <ABA1710E-FD64-4F28-82D4-EC375EB1EA31@arm.com>
Date: Tue, 30 Jun 2020 16:24:51 -0400
Message-ID: <CADkTA4Ogdx1UvPVOwjhrmUTaVaqOtNw_gxs6iiqQ0FiQOU6Dmw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
To: Ross Burton <Ross.Burton@arm.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Ming Liu <liu.ming50@gmail.com>, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
X-TUID: yq8eLqnmmVUT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 8:54 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 30/06/2020, 13:48, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
>     On Tue, Jun 30, 2020 at 8:44 AM Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>     >
>     > Hi,
>     >
>     > thanks for working on this. I'm still don't know anything about gol=
ang in OE, but from earlier post from Ross:
>     > https://lists.openembedded.org/g/openembedded-core/message/139437?p=
=3D,,,20,0,0,0::Created,,go,20,2,40,74838027
>     > it sounds like these recipes shouldn't be using go-native-binary, b=
ut go-cross-${TUNE_PKGARCH} which isn't prebuilt and will probably point to=
 the right header files in OE sysroot.
>
> Right, use the cross Go, even though they're meant to be the same.

I have a build that completed now, I'm doing runtime testing. But we
should be clear on the build side now.

Just in case anyone else was looking at this, you can stop, I have it sorte=
d.

Bruce

>
> Ross
>
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
