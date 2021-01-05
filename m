Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.202.1609882079718246912
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 13:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dmqGE8kD;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id p22so2327233edu.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jan 2021 13:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+j7W7D5eLNPMTrAjEUyFXsoGqv5GWIpJf+quzGfDNU=;
        b=dmqGE8kDEHT50qd6QcYLmbOcw5VG8HgLworRqzo93pgrywq1o7pQ5Sv/CuosS4mnOo
         GOrGRfglYktbYLMdclYAIwA3ac5fAT+o/dyA1QCq5kxxvYlx/80ACYPMyfxsjW4DIwLH
         fxaX/k3jsV127Uj4q0Pkun3VtuNAKShAQqHT6DK4Uex9o/9zr00iHqC+Z0NnJh4pImzy
         MGx02tAYJquHHKbLtj1YqqiFDx+Fj5Esc+bUNRuxXAuGzd3P0E+kJufN4bD68ckAulci
         VlBo8tXGpKDr8U5BkidM/WDzZesM0v769O6Yf9sOjx964xzT81NEm9UrwcAoVm72LINF
         J0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+j7W7D5eLNPMTrAjEUyFXsoGqv5GWIpJf+quzGfDNU=;
        b=UiIAqfqUw/HijAVj1dVDXkgPwhhb4AYTpyUk2qtQ1TQvQg9aA/F6Rh2i3MYWuC9cX4
         x3a8goJ1f02XS7Xco6qlJcKNFHJ5pyOk1qStc12mVekeKFeXJIkjkDQaLUJDeh7v/vVh
         4prK5TqnHi6OUjzxfi2CVUYcEtDsy3xzg9lyAglb3TR90ndj56XvHgINRFxFFfjQPbXU
         3GsZ2gUxlqR/4ERFQhoACaecL9g3hTOrhHN+4ni27iNSQSG+VrOs/LwpnNzgvXf4wdUk
         IsIADJAlb5NivD1IxbtHZ881hg7Ag1m98HtxfA2YiNv1G2LfXdmKoVjLIhax1DleFpaj
         15Zg==
X-Gm-Message-State: AOAM5334LxgCtVUI36Vvg3xpjo6C/GRTSicq7jGthmfTjEgCUU8jiDYh
	IHoJKxp8J+Jg54jL1TEkYciv+HvJPYv9tVdlP7s=
X-Google-Smtp-Source: ABdhPJz6e1mCBjUm7x6ZsuDzytQxYF9aUPpgPxzLhc7GToXPOD5V2AXOlta1SpLXJSxuoO2l28v0Q/UEs9HmkVgVVoI=
X-Received: by 2002:a05:6402:3553:: with SMTP id f19mr1754303edd.129.1609882078150;
 Tue, 05 Jan 2021 13:27:58 -0800 (PST)
MIME-Version: 1.0
References: <aee11c2c-09f-1c4-3a0-13b1b2338030@crashcourse.ca>
 <CADkTA4Nf59A4F_JrPOtv77FK57nNEVjEvirhuegmWc=WwJzyhQ@mail.gmail.com> <4720fd3-e8d0-544f-2388-15f275d631@crashcourse.ca>
In-Reply-To: <4720fd3-e8d0-544f-2388-15f275d631@crashcourse.ca>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 5 Jan 2021 16:27:47 -0500
Message-ID: <CADkTA4MNV+yRXHL0X4=qTxGYD1E13rtvLPAN433Rbf+wfazqBg@mail.gmail.com>
Subject: Re: [meta-virtualization] what is the state of meta-cloud-services, re: chef/puppet/ruby recipes?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 2, 2021 at 9:20 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Sun, 27 Dec 2020, Bruce Ashfield wrote:
>
> ... snip ...
>
> > No one has done much with the ruby support in quite some time, so it
> > would need work as well. I thought there was a meta-ruby floating
> > around, but I couldn't find it on the layerindex, so it looks like
> > just oe-core + some work would be required.
>
>   dumb question alert: i'm currently going through all of the ruby
> recipes in meta-openstack, doing the occasional fixup to get them to
> build on the master branch, and i can see that all(?) of those recipes
> define a SRC_URI that downloads a proper .gemspec file for each
> recipe, which allows the recipe to build.
>
>   *however*, even though a number of those recipes BBCLASSEXTEND to
> class "native", it's not possible to build the native variants as the
> error is that there is no gemspec file for the native variant. which
> is why i get:
>
>   $ bitbake yard-native
>   ...
>   Log data follows:
>   | DEBUG: Executing shell function do_compile
>   | ERROR:  Gemspec file not found: yard-native.gemspec
>   ... snip ...
>
> what's the magic to build native ruby recipes? does one actually have
> to define a distinct native version of the gemspec file for each
> recipe?

I honestly can't say. I did little but review and merge the ruby
changes. There was a primary author for the changes, and I haven't
heard from them for some time.

I don't recall them really being used in the -native variant, so it
could / should probably just be a mass removal.

Do you have a use case on the -native side of things ?

Bruce

>
> rday



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
