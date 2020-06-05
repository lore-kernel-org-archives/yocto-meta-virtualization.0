Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.3.1591384739195834443
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 12:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EF6Nd+72;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id k8so8315394edq.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2020 12:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VGwcTcy9pmgAgSdRisTw86cMX4Er8yelfPBRHMWyyA4=;
        b=EF6Nd+7233mqJ5ijxYtZqWEAYD8PbAjGl8QUDDldoc9M9al834HQCFA84J6QahIY7Z
         L3+88jEU6tLOfRktZ2jSwRS5W7kVHT62WP4GCPz58hSjDPOpqi7prooeSbbeFzaGQwHc
         m6imf7Wc5OeHK+cRbrRk1vxKqbjxmPNsVu5UYw1YkxhF33M+a5X12PsJC7PUY65AhiJT
         NvwLr/AjZ6rDodpYLKJr/eLpB4s1jYMqx8FD2Er48Ui411947TaGsrEmKGweEpCYSAPN
         jONEA7EJXl7jwebXVsvC49kjSeRAHx9oFeeuYcmpqVHB7Af7Ybh2WHlgnXLcyZy3n6lB
         iymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGwcTcy9pmgAgSdRisTw86cMX4Er8yelfPBRHMWyyA4=;
        b=mTOB1KTN7sUi4UT3DyJFXXS/CZZnNJADgcddkfsHHo7DDW87bLPY+QgsjXnvRygo7K
         JiiTcv9/N0Srh6VdgzvJ2W6tzqg85nZLgxDF1EGoy4GYu9hra7sQeSF/HjoeZVx9bw8Q
         s9xOaJu/4UBvFGhz47rJjEI6vZ5B0+jQADlG6eXOBPwGWkJbWPjQUj8gpBhnAdeibELD
         myDOqx1z0AwvYcEH4sb4ObwdWVaTVgrygAyF3kr2/shgth43BkPU4DsZnYW1l90XK5b9
         TXc7/uqeLTbZuRwa5txjEX24nGS/w2sNk37210Uhw9KaUPk2MlUTx/2foVaEgxVgdMiT
         SNtw==
X-Gm-Message-State: AOAM530vP41fheGqTJN/FUt4VMG/ZEqZGdSJVNv5n3WJDoiAxd4Be9DU
	FoC1LBkjS3TFnZkLtEEvPpMhc0nZVI8v+SrBczg=
X-Google-Smtp-Source: ABdhPJwLWNo/pAfYAb1nDS2UOIdQKXAJ8RwsFrkeaEkWZFkMZ9+ARUBJISJFm3yIxFQP0yFf+dtrxLnCwKjZjI5Y0tw=
X-Received: by 2002:a50:9e21:: with SMTP id z30mr10335885ede.347.1591384737529;
 Fri, 05 Jun 2020 12:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <F6Xm.1591272345632844743.Xl2d@lists.yoctoproject.org>
 <96BF8243-B90E-4E4B-B7D0-29A384966AAE@gmail.com> <CY1P110MB0551CF1CC39152785C654EA08C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <CY1P110MB0551CF1CC39152785C654EA08C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 5 Jun 2020 15:18:46 -0400
Message-ID: <CADkTA4MC7ineV5KfEGGNOC35EMxvVLrbGUxHzp1ESpo4rxstAQ@mail.gmail.com>
Subject: Re: [meta-virtualization] How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	Siddhartha V <Siddhuvgowda.18695@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand
<stewart.hildebrand@dornerworks.com> wrote:
>
> On Thursday, June 4, 2020 5:13 PM, Christopher Clark wrote:
> > Hello Siddhartha,
> >
> > I am also interested in running Xen on the Raspberry Pi 4. I hope to have time next week to be able to look into it.
> >
> > Christopher
> >
> >
> >> On Jun 4, 2020, at 5:05 AM, Siddhartha V wrote:
> >>
> >> Hello dear meta-virtualization team,
> >> I am building the xen minimal image using yocto warrior ("bitbake xen-image-minimal") by giving the target machine as "raspberrypi4".
>
> Corey Minyard created a layer for Xen on Raspberry Pi 4 here https://github.com/MontaVista-OpenSourceTechnology/meta-raspberrypi-xen
>

Someone needs to lean on them to get patches submitted to meta-virt.

Having a layer like that, with fixes missing from meta-virt, makes no sense.

Bruce

> Thanks,
> Stew Hildebrand
> DornerWorks, Ltd
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
