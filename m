Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.36435.1609096854461866021
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Dec 2020 11:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iUEXFRw+;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id n26so11826350eju.6
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Dec 2020 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gyiG4V8VPZl1dDR40ifra2Ili7/croCeeVPOzfTjAq0=;
        b=iUEXFRw+oFLpVARd6NK53y94FZ3bau3dzXDfY+22/i+B48hjvUiSrtSGE7u8YZHaAa
         /zfzCyVxtCD3peXi3JyZbvVqSDRdbjBmcMN5QyYyTjfixx+5BIRBqx8XmM1Z6fc8+5Tq
         Q2ekwlfKCa/IqwS1st1E4DE0DxoICc2rKURVlT3yjs19erKhgscjGJzkpyf006RQx+rP
         FJAn8pRDO5Jwf0kSmShhebwWet547wbGNaXUdi1WqIe60LFUrFolzFMsc23q4r5Mx3Zq
         y3aecMYARdjgPPCksXY0JTfuVpdwUiBVmVE6UD2mzpiTIJ8OdTXLeKaoXRl192gFwhhI
         xpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gyiG4V8VPZl1dDR40ifra2Ili7/croCeeVPOzfTjAq0=;
        b=QB8zPFEB4HUjoDveMeAmGh81hHlO75gbC8X9ua7qMi2ySwQcfd4rsTvwoL5aEx+x0s
         GEvQr/fX4ESHpKXnhgBRvBMQTtunRIs2nncAgY7jKXLuroMjFgAHkDjZ8O2KbIPQEno0
         Gpap/zmNdtDUDd4ZAqSUzc0Njpw0R82T1pTftdDnTe+rgE5DiIL38zbo1Jk2LfnTWb92
         rEki8X8rirSoqEfqh6qtCsYpR5gVMB+8rXQSyP3eQYHuVv3+g3SlerKetKbhEKRUf1t7
         +sU2KSFYOVx6soXa0GoJHp/a+qe0hI/I7hmbINR+7m8Wxb1UZW2Ovut3naST5D2hdDuX
         nyng==
X-Gm-Message-State: AOAM531HMBI0xT/ckFZRs/ChUfoXTNWumKRz9xQqKxoIVordlF1N6z82
	sbqGBejCIhj99O1cj6kF8xTIjpBoiFNTDGc4swY=
X-Google-Smtp-Source: ABdhPJxtXSg7kHOD7tY9lVB82N6XctwVSnw88o46JQPDMPcGpsbnoqK4/Fqi+plfjIlhOqRoRyMKfFe+vni0B3cPXe8=
X-Received: by 2002:a17:906:6448:: with SMTP id l8mr13115419ejn.357.1609096852818;
 Sun, 27 Dec 2020 11:20:52 -0800 (PST)
MIME-Version: 1.0
References: <aee11c2c-09f-1c4-3a0-13b1b2338030@crashcourse.ca>
In-Reply-To: <aee11c2c-09f-1c4-3a0-13b1b2338030@crashcourse.ca>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 27 Dec 2020 14:20:41 -0500
Message-ID: <CADkTA4Nf59A4F_JrPOtv77FK57nNEVjEvirhuegmWc=WwJzyhQ@mail.gmail.com>
Subject: Re: [meta-virtualization] what is the state of meta-cloud-services, re: chef/puppet/ruby recipes?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 26, 2020 at 1:28 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   followup to earlier post of mine on main yocto mailing list, now
> that i realize this is the right place.
>
>   using gatesgarth version of layers, i want to test build puppet,
> chef and a number of ruby recipes, then dig into how to extend/create
> my own ruby recipes, but i want to first verify what shape the
> meta-cloud-services layer is in.
>
>   if i use "qemux86-64" as my target, i started off with "bitbake
> puppet" and that seemed to work (it didn't in earlier versions, but i
> see no point rehashing that here).
>
>   i then moved on to "bitbake chef", hoping to verify that an
> absolutely generic build would work -- customization would come
> later. now, even though chef doesn't need "yard", it does depend on
> yard-native, and i have other needs for "yard" later so i tried:
>
>   $ bitbake yard
>
> and got:
>
> ERROR: yard-0.8.7.6-r0 do_fetch: Fetcher failure: Unable to find
> revision d83194e1a09098ec5be28b616cde3b9a15380873 in branch master
> even from upstream
> ERROR: yard-0.8.7.6-r0 do_fetch: Fetcher failure for URL:
> 'git://github.com/lsegal/yard.git'. Unable to fetch URL from any
> source.
> ERROR: Logfile of failure stored in:
> /home/rpjday/oe/builds/puppet/build/tmp/work/core2-64-poky-linux/yard/0.8.7.6-r0/temp/log.do_fetch.1418067
> ERROR: Task
> (/home/rpjday/oe/dist/layers/meta-cloud-services/meta-openstack/recipes-devtools/ruby/yard_git.bb:do_fetch)
> failed with exit code '1'
>
> well, there's an obvious reason for that -- yard is one of the many
> recipes that succumbed to political correctness and renamed "master"
> to "main", so a quick patch:
>
>    SRC_URI = " \
>   -    git://github.com/lsegal/yard.git \
>   +    git://github.com/lsegal/yard.git;branch=main \
>        "
>
> resolved that issue and i got a build for yard, but that's a bit
> worrisome -- that seems like a really blatant error in that it clearly
> won't even allow yard to build. obviously, i can submit a patch, but
> it makes me wonder what other trivial gotchas are waiting for me.
>
>   with that patch in place, i figured i'd try the following, which i
> would need for chef, anyway:
>
>   $ bitbake yard-native
>
> ERROR: yard-native-0.8.7.6-r0 do_compile: Execution of
> '/home/rpjday/oe/builds/puppet/build/tmp/work/x86_64-linux/yard-native/0.8.7.6-r0/temp/run.do_compile.1419759'
> failed with exit code 1:
> ERROR:  Gemspec file not found: yard-native.gemspec.gemspec
>
>   i'm still digging into gemspec files, but it looks really weird that
> the file suffix is ".gemspec.gemspec", as if the code somewhere is
> accidentally adding one of the suffixes, not realizing something else
> will be adding it a second time.
>
>   am i investing my time wisely? has anyone else got a working
> puppet/chef/general ruby build environment up and running? sorry for
> not being more specific, but i don't want to spend hours only to find
> that no one is looking after this layer.

meta-cloud-services itself is maintained, but it doesn't go through
global builds or extensive system level testing.

We are keeping the recipes that different users care about, up to
date, and building against the specified yocto release. But other
layers (like meta-openstack) are in a state of waiting for interest
and contributors to become fully functional again.

I'm also migrating some parts of meta-cloud-services to meta-virt
(i.e. I just pulled cloud-init over), when they get broader interest
or have a more generic use case.

As for the chef/puppet parts, the original implementation was
problematic, so I had to undo parts of its recipe changes, and we
haven't had a call for using it as a deployment method since. So the
base support is still around, but as for using it to deploy an image,
that work is custom and typically (if at all) done in other layers.
Just like other parts, I'd spruce it up (or move recipes around to
other layers), if we get more interest.

No one has done much with the ruby support in quite some time, so it
would need work as well. I thought there was a meta-ruby floating
around, but I couldn't find it on the layerindex, so it looks like
just oe-core + some work would be required.

Bruce

>
> rday
>
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
