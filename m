Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.4349.1582637629115970968
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 05:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oc0T96sv;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id p23so16253433edr.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Feb 2020 05:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+/fPFhJdctErzmUldvTGaegASuMjxW4dEgURgvsaxc=;
        b=oc0T96sv5zXHS7ixGNJ6E80RdXO7m2+6bFo7mB2YdbJnG9D0u+Gqgoj3zOi3XN/J7n
         43Gom8b+AZIclWpDg82vanXCHkHVuy2WOY1+R7k6Ncc16ZgqZ7wFKt1d4QeCoebT+PIV
         DlM8fKK5y5nYwIupLDLYdxqoiRrIfO9ywmYz8YZ62UqvuAS3lLiiI6pY3MO5bQUd14Ad
         uqN9qjZX5SrgmlG8jevYBgR+DEUY+puD6Y4ehdOYsprowPUG1hBqKP1fvLGyxi4f9vjT
         CZs4dU/U7udZ3/P/bLWGARg8u2jXjcFV8tyI9Uryc08183ci1Ltfa1kLZ9j9+/lf0vLM
         HS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+/fPFhJdctErzmUldvTGaegASuMjxW4dEgURgvsaxc=;
        b=HzyVXA07M4vLREJyjp7ab8jtzFHCPpW3qf3C1n6SfjJa7pK3uNImTo1hF6qVxi6pxw
         JY4iIIOPioE7UuJySZrKW2Q15iE1El+GAJgRuqpnDeCp2gDdyHrQku8RhotxZSbxk+/K
         ew0DWpe8rTHDKE7VLTnj5iK6GCgzRWMF/hDK0QsShOqrHckIIBoetzeMYXphSXCYOJad
         eoO08Ebh0THGpuPjb5rfW4Ka0X3qZJ2A0ftloMOy1H7FRj5Er74exMApj3fPqwuzX6gu
         Vp+6r86FEe9OSB5/mG3tspfGcvOp+Fs1AqVLeKQCgvLeEPogHi1QlaR7jfoGXoIWG2SK
         18DQ==
X-Gm-Message-State: APjAAAVorVeTe7TKqpVNusAeCjIoSvVzoHvO0TvzBJngqi5P2HJCvhUy
	XWY9CGQxZEF7PU0FCYuykVJdzqfPMyhgfJmO2m0=
X-Google-Smtp-Source: APXvYqwk9S215A1mfvWW4t346+yH8tRLys3ONGvXjxdpiPgNc5PzAEU+pM/VZyeMUtcxJGMVqhcSqMW5HxYvZjGaW0U=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr50220672edc.129.1582637627495;
 Tue, 25 Feb 2020 05:33:47 -0800 (PST)
MIME-Version: 1.0
References: <1582613221-56653-1-git-send-email-chee.yang.lee@intel.com>
In-Reply-To: <1582613221-56653-1-git-send-email-chee.yang.lee@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 25 Feb 2020 08:33:36 -0500
Message-ID: <CADkTA4M6PKA4wJ5vrOYis+q7Tvw+xAbQG7TMyim-Xz_+PZywfg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] linux: add bbappend for generic cases
To: Lee Chee Yang <chee.yang.lee@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 1:47 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> add generic .bbappend for linux kernel recipe to allow
> all linux kernel recipe with name "linux-%" to enjoy the
> kernel config from virtualization layer.

The generic bbappend makes sense, but having them completely
unversioned is an issue. Having them completely generic gives us no
way to adjust the names as they change over time (and they do) and can
give the false impression that they've been tested or are valid for
any version.

Last I checked, the % wildcard means "until the end", so we can't do
linux-%_<version>.bbappend

I've always had the LINUX_VERSION variable in linux-yocto for cases
like this, so I'm wondering if not only can we check the distro
feature, but can we also check the version before doing the kernel
feature addition ?

I've cc'd Richard, in case he sees this and can offer a suggestion.

I'll think on this more, since I'd rather collapse all the
linux-yocto* bbappends, into a single bbappend that works like this,
so not only can it be used by other kernels, I can actually test it :D

Bruce


>
> [YOCTO #13727]
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  recipes-kernel/linux/linux-%.bbappend | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 recipes-kernel/linux/linux-%.bbappend
>
> diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux/linux-%.bbappend
> new file mode 100644
> index 0000000..20eeba9
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
> --
> 2.7.4
>
> 



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
