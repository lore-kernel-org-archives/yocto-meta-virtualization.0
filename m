Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.8717.1619450988040859726
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 08:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u7hGKcub;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id n21so8869942eji.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Apr 2021 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ofbK53n8Wzme0wAlleZ7d6WhBUdfkTWOQTIgBkXRE+I=;
        b=u7hGKcubaLmNGDx2Co1SI1gyfIdy3dQ7PzDzO5I2wr34W5ANAYn18kBO2ucfIdJNLW
         jeWK1vrAyiNTRUUGr0gdRH6svSA6mNW4AoHrwcGitO4pLnMIeQD42s+oJ+/z3W5kO8+C
         7pcXTT8xClMdCavHKEFNqQXvCeyKiBQ6ViC22kSPI4ocZGQ6hqAHuB8lKJthq77iNAHf
         3VJjBZmVKVbfij2NSJNMvpq05NfzAd6t9bCr/kFP/JnRkBTV2fZbHJWIjM5g8Cyu2KhP
         zLmYDkR8EOnXLJtSdg1GMFp8/cP3/2TNRME3NL3S5c3Lt/Zo52sw9mJDW87J4QUQHMdH
         Nhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ofbK53n8Wzme0wAlleZ7d6WhBUdfkTWOQTIgBkXRE+I=;
        b=ZSd6Uo/dXYP6Y9GOCAvVFWRwRa/1H6X9XUlBiGJ1SHhOOyECaAfJ/CVx9LO5gaYqiE
         18vhk4G9sMioy1OvIZUKrx6WuOrpkZeCvjpVNjiJgTIgkLlBOJKWIzTeZ/F8MhK4pKYJ
         rAg0CsA4lSV5hAlV+71lkPUJIpzgyvfNxh4pUj/gZ6vqOa7o0TMUFAGYVT29G1pLCc20
         uJ7R3ME8GHo0szVof9oD8T8Oz7UbVL49Xup18Kg0t2W8KW66Z5L15cTHoC4AS1P7OI04
         fFbgyEOouhptpxxu8gHO+mC4mNB2x/7heg5HuahjaG/nDdpDh4D19nn4PWiNwnz7BCjg
         oIOQ==
X-Gm-Message-State: AOAM5333Kxn0H1qt+1EfquvwzjJsyOApWODjlRI1sxT4z79goGYpGCyE
	mrQluFKBrVMUdLcgNSn7re59BFgsVnim1kvCEIQ=
X-Google-Smtp-Source: ABdhPJxBJa41/3MQeuOJW0umAcZAj3wNqoiK4C+d58NLOr7UMjx7DCBmccEOwXW/RKyzth+HozUIEFdMB5UhI09HNYk=
X-Received: by 2002:a17:906:a103:: with SMTP id t3mr19477931ejy.334.1619450986464;
 Mon, 26 Apr 2021 08:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <1c6a7d3e-9a4f-d989-ec97-839d3225268a@windriver.com> <26420.1619446082417741121@lists.yoctoproject.org>
In-Reply-To: <26420.1619446082417741121@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 26 Apr 2021 11:29:35 -0400
Message-ID: <CADkTA4NpWUdnvdkijmoaD-RPBbLzCjqVf4HK+QvxGoesnL=UKg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: uprev v6.3 -> v7.2
To: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 10:08 AM Daniel Dragomir
<Daniel.Dragomir@windriver.com> wrote:
>
> Hi Bruce!
> Do you know when this patch will be back-ported on hardknott?
> Currently in only on master:
> 9f35986 (HEAD -> master, origin/master, origin/HEAD) libvirt: uprev v6.3 -> v7.2
>

I didn't currently have a plan to do that backport, since it is a
major version bump and missed when I had to branch for the release.

But if someone can identify a particular bug fix or feature that is in
that release, I can revisit the options.

Bruce

> Thanks,
> Daniel
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
