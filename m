Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.5232.1603196289988657188
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 05:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U61ItYJh;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id e22so2379493ejr.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Oct 2020 05:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VoistBOTh7XFSrbdA90x2b6iDp2EPCCKBGC8+54oboQ=;
        b=U61ItYJhXfcKsJAW6lRgTVtJuEQn9Oy37gECItoHBYefTptQQPYctqbSNK2gbEx4ir
         a6YNTaqZL5/XcIRTApn5dmyDIUbAica9m9RvkUDRHyL34S473oQfq/HwvhA5R5IBGI0j
         5qU8Lf6bfbQ1WrV4zRY0rMHKil0x7IVaWIuntDFYGoNL/GjGeJK8GyoYudf49I8i9jHj
         +bT4LlVj22uZtt7M+cqIxt8v1DIGqVEaSg0ioS6649zDX/8S3ewZjvf6RTYE9oQ6dqEx
         wSTq6TvXQo5w+3yMXg8Iiv4dKg+NvbXSpCLAIk1uuSpBBpe8xijRpu3iTOZ3Y1G4hVUj
         n4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VoistBOTh7XFSrbdA90x2b6iDp2EPCCKBGC8+54oboQ=;
        b=Cdhl+PznunMFBjhSwH5pscUVMmYAs+cMFd5bQvxTgsGpX539niUPVQfKRegdKkieUH
         YOGHwYWoWl799UPEMfxc4I04sDhB6HPX6Rg1FOPh/pNWf7LBTDs3GAvHKzEzGpb1a1xe
         iB5Am+Ggv9T8o2+d0SJFr8+gMHAP9nV5PfFJfYcV25bkIHZNDlek/YEXatCEoVY+6V5R
         QJHghBS/iJRH+iodPbxH5lbMencB1dtokYLemTOuEL5yYRfHGbPOh+DYJ7rSkzNZpbr+
         a9aafhO86+hqigt06dZXXYOgTIDo8DlDvf90plHZp1vdROXWeWnvYHqnZBCcel5KgXCT
         47SQ==
X-Gm-Message-State: AOAM533I6OPfiaaDfOauxfhgne/CoSLfjqcQOdWc+0IPSVaSGBIYHDot
	j9ygY0zIzwdiSLx8//KZ18mK2orfnU+SvWpDn7g=
X-Google-Smtp-Source: ABdhPJxa47UlLVnA4CPnoUXHDJwT91pvSDhunp7hg4sX84Tg+03hg/+MlXP4SvbKAtI8LzQnhCLiGFnZUPJ1KHehMsg=
X-Received: by 2002:a17:906:a859:: with SMTP id dx25mr2783126ejb.459.1603196288338;
 Tue, 20 Oct 2020 05:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.23.451.2010200556030.7142@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.23.451.2010200556030.7142@localhost.localdomain>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 20 Oct 2020 09:17:58 -0300
Message-ID: <CADkTA4MdrbfQhNctC0S5otkjxRJ_h7m6u5Vyz7A7SBZN1WDVwg@mail.gmail.com>
Subject: Re: [meta-virtualization] oddities in meta-openstack layer related to FILESEXTRAPATHS
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 7:04 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   this just doesn't look right:
>
> recipes-devtools/python/python-salttesting_2015.2.16.bb:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
> recipes-devtools/python/python-nova_git.bb:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
> recipes-support/iproute2/iproute2_openstack.inc:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
>
>   it's not just the lack of a colon; i'm always a bit leery when one
> *appends* to FILESEXTRAPATHS. i will let those higher up the food
> chain deal with this.

It's just adding to the search path, and since whatever is in them are
unique, it's on the end versus the more standard prepend.

The lack of a colon, could definitely cause issues if another recipe
were to try a subsequent _append, but that isn't very likely either.

That being said, there's no reason why it couldn't use the
standard/common _prepend.

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
