Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3363.1604697667344879224
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 13:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DcUgqDvR;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6E72538C086F
	for <meta-virtualization@yoctoproject.org>; Fri,  6 Nov 2020 13:21:06 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id y15so2520627ede.11
        for <meta-virtualization@yoctoproject.org>; Fri, 06 Nov 2020 13:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nq3P0vB2eBSTXKFoDJ/W44mRvU6AY9Fhgv7dtWbXZ0k=;
        b=DcUgqDvR/pyMD1xzlftD9ZSHa8YfdYNptZewbRV72NuiKen3uIwixnqeISr0hLzthm
         sG9XCX26EJ16OsbzrHl+EX+qoNK19oushiEb+UlrO30Mk6D9J7axgm3j8klHQtU1kkSt
         wgCtsoBSGb3ieA+GNtoyW4qV0331lwEveltj5pBobafEQISm76c6bBqbhCfBEM+1c/X9
         BE3UjB8cFydUwvrTi0rZ7lqsuvRqWcu8tpiL/bqm2eNj7C4wn0XLjrxGuIGzgIA3Njk6
         MwWUbTT8s6l9dcvmLR8GIAFe8AwGgGHnZV89ZI0O4m6rhQNuMYjBd0Q5Xf4D3K6plHtP
         KkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nq3P0vB2eBSTXKFoDJ/W44mRvU6AY9Fhgv7dtWbXZ0k=;
        b=lBuUX1ycyrSnR0rNrlg43AIuUSGDtH0c1U6s29XduQ+jCxDHjHwvQTGMBT8C6oAZ2z
         1sruqcrRe0BhxE/AAJsdlFsfsajDgwMDKdqkQcDtqR8K+LCPO1PLfyZgdS1BF5rF9suO
         5mgroN/nSh7IsexadJ2SF1JvuTDnBRLKRHpbxdFaJ77dkGtutomP9bP3tpi2B+ipphl8
         1fn3tQooTG54+I+dNOTKst+NFaCpOTbLl55WQv+1+/eM9BZ94APSjerV7mGnB3mM6BBh
         XV7H6S1Ac4I7oMzGQ5hLfjxzRMxQIgCFtuAOi0w55F71vOqhE0IRvK6rAfi8sakqYYD4
         Xn8A==
X-Gm-Message-State: AOAM533aVqyNIe8vMDBy9Sx+OFgXmIwlyFjDTzQQ8IoN3hDisMp4tZjm
	1PNn8dxJX8UfBJi5VC6kbVots41bD6cK+VDfz6PW/1J6C2i/B5yI
X-Google-Smtp-Source: ABdhPJxw24/yzv3oQc/EE9hTV+LNQ0Ui8Rb6G5SkdGpZpSpAGlm0KYolj/VAAOysvwgXabM9uZUy+zmK8OgvePv+jvk=
X-Received: by 2002:a05:6402:17ad:: with SMTP id j13mr3972449edy.347.1604697664673;
 Fri, 06 Nov 2020 13:21:04 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <af00b32f-7619-a755-13b1-714675419946@axis.com>
In-Reply-To: <af00b32f-7619-a755-13b1-714675419946@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 6 Nov 2020 16:20:53 -0500
Message-ID: <CADkTA4P6UmsrfZ_Lz=8=0hiNKD9ji1o5nHNy6ouJMK3spAP1NA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2020 at 4:32 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2020-10-26 16:46, Bruce Ashfield wrote:
> >
> > ERROR: k3s-v1.18.9+k3s1-dirty-r0 do_package: QA Issue: k3s:
> > Files/directories were installed but not shipped in any package:
> >    /usr/local/bin/k3s-clean
> >    /usr/local/bin/crictl
> >    /usr/local/bin/kubectl
> >    /usr/local/bin/k3s
> >
> > So I added them to the FILES of the k3s package itself (so both
> > k3s-server and k3s-agent will get them), is that the split you were
> > looking for ?
>
> Yes, it is! In my build, all of those are found in the k3s RPM, although
> the FILES directive for them is missing. So yes, your fix here is the
> right one, IMO.

I now have another 6 or 7 WIP patches on top of this to try and get a
single node "cluster" working with k3s. I'll clean them up and get
them into the k3s WIP branch shortly.

I'm failing on the networking component though.

In your working references, which iptables do you have installed ?
(legacy ? nftables?)

I'm failing to get flannel to start, with a series of errors like this:

-----------
I1106 21:19:00.985656   10641 eviction_manager.go:351] eviction
manager: able to reduce ephemeral-storage pressure without evicting
pods.
E1106 21:19:10.636899   10641 proxier.go:841] Failed to ensure that
filter chain INPUT jumps to KUBE-EXTERNAL-SERVICES: error checking
rule: exit status 2: iptables v1.8.6 (legacy): Couldn't load match
`comment':No such y
Try `iptables -h' or 'iptables --help' for more information.
I1106 21:19:10.641647   10641 proxier.go:825] Sync failed; retrying in 30s
------------

Which means as soon as I try and run an agent command, the server dies
and I can't even do a basic test.

Bruce

>
> BR,
>
> /Joakim



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
