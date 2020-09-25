Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.7506.1601039543096864129
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 06:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JyWQnxVz;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id q13so3537233ejo.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Sep 2020 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xc4Soeb7WFUSSf+kJiqUWDEa5dTjRt4hwBYgoVQGcpk=;
        b=JyWQnxVz+aH7VBfGtMUz3190UUUygGaYbXrHj207HeaNYqX4y1e+Q2SwefksywUbWb
         P6si9vTVobIs9vpAeSf9ggmbGcQhPsD8OOlMHcwPsTGBE5mdxqzcXU7jmh8tkbqqZFX7
         ZdbUD49U+zM5JX+3SxjQPuZn08mkhexYaGqSd3vvnH4RXSxDeO0PUXlylED3o4bJMyUQ
         mFecokFQbDEf8JENSu+IofyNSQhiSiFRCHQqY0yYzhTr1bnVkB2ceGcTVjOmjZU4GsdK
         X+pCT9VAtUqsRgge0+ddc/Xti0RlPmKzU+wfNrR9cOMFGet1uL8ArvnQRuwYioLottDU
         ElgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xc4Soeb7WFUSSf+kJiqUWDEa5dTjRt4hwBYgoVQGcpk=;
        b=DoGiITU43Iy0LoPoKBIN7vOzzcFITr0jd4UoJutZpKKmSO+hgdndIZBidt5/LM2Qlq
         qKyZoPRDS9YhaL3Jpa2nli+7F0iNk71Ttam7htleA55WUYwdbldGOy4xFTAtp6XbYD2P
         BXZWv/M04pAjHi0TP37jspVXAS2I9Ln6UOhPWlWfBVQfHEOGRLDjN84PUspjll9cdD0q
         KpcQEgFqcxBUdFNCHDI7o2SNv8XcxLOZAH2AYEt6+u8o4jRYYRjn87WwEJ/+ngfmAZ+B
         wXbc1eeXxXq6KgTtDSrR51gcmCpDAZMXlSx8JdtrTCnix6L92XNHzjn3uheGb4BRVJLl
         VejA==
X-Gm-Message-State: AOAM531tG19qsxKs26nZm/nnae3iwgbhYC2KnbBgfm4KgnVe38Me6eE4
	VK2cHeST1zoiF0z2ZzOYTF39w8H4+kMGJFSAjT0=
X-Google-Smtp-Source: ABdhPJxvxeVhivvNkN/LRcBTjBvoQwtVUvvA79wffaqrQ7WdbJqjAQYm98x9sgXno/gx+QPG5XCn2zqrSr8L1Ji7Few=
X-Received: by 2002:a17:906:19c7:: with SMTP id h7mr2555192ejd.517.1601039541338;
 Fri, 25 Sep 2020 06:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200821205529.29901-1-erik.jansson@axis.com> <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
 <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com> <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
 <ae269803-37c4-d72a-d19e-097a093baa60@axis.com> <CADkTA4NbKfrK0CwQz7P5ecGCgL_d_0CZnuROoVTL=iLWJ6kvMw@mail.gmail.com>
 <8943d000-4ce1-164b-eb8e-2bedfaca2981@axis.com>
In-Reply-To: <8943d000-4ce1-164b-eb8e-2bedfaca2981@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 25 Sep 2020 09:12:10 -0400
Message-ID: <CADkTA4PNMnRJ3iZu0TvsK+8S_MMySNxx-=fk7rFuCCOStcRdWw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 25, 2020 at 2:20 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2020-09-24 17:41, Bruce Ashfield wrote:
> >
> > There are at least two utilities that are shared with the main
> > kubernetes and not in our existing layer dependencies. We shouldn't
> > expand our dependencies more, so we have to look at importing a
> > variant of the recipes to meta-virt, or seeing about getting the
> > recipes into a more common location. In particular, I'm talking
> > about ipset and and upx, and I'm still looking for more.
>
> Ah, yes.
>
> > As for the service files, the k3s.service is different from the one
> > from the latest on the k3s 1.18 branch, and there's a patch that
> > modifies it. Although tempting to not use /usr/local/bin, for
> > maintenance, we'd be better off either just installing where things
> > are expected. Was something broken if /usr/local/bin was used ?
>
> The target systems I work on prohibits installations to /usr/local, so
> from my perspective something would in fact be broken if /usr/local/bin
> was to be used. Nevertheless, configuring the recipe to have
> /usr/{$VARIABLE}/bin and VARIABLE set to "local" as default would
> perhaps be an option for everybody to eat the cake and still have it?

Absolutely. I'm always in favour of making these configurable, so we
can let users customize as they see fit.

Alternatively, rather than substituting just the 'local', the path up to
'bin' could be controlled.  And by that, I mean a variable local to the
recipe, like you have above.

That allows the use of $bindir by default, and also covers the case
automatically where someone has changed $bindir to /usr/local/bin.

The local variable allows yet another override if the global $bindir
hasn't been changed, and you just want to modify it for this recipe
(which is actually what I think will be most common).

>
> > The other .service files, we have no idea where they come from by
> > looking at the series, and as such they need some sort of comment
> > (by looking at the repo, you can tell they are variants of the
> > k3s.service file, but that needs to be clarified).
>
> I will investigate.
>
> > The patches themselves to the code base (not just the overall git
> > commit) should have Signed-off-by: and Upstream-status: flags, so
> > they can be maintained as I bump through releases.
>
> I will see to that.
>
> > The scripts being created by the recipe, need license headers and
> > spdx tags. Boring, but it is something we want to make sure is in
> > new files.
>
> Absolutely!

I just had to go through the License / SPDX header addition for
hundreds of files. So I know what a pain this can be, so thanks!

>
> > Also, at a glance, we need to make sure the dependencies of the
> > scripts are captured in the DEPENDS of the recipe (i.e. I see 'ip'
> > being called, make sure that is captured).
>
> Ah, yes, I will go through that.
>
> > As for the networking, what we have in the submission is specific to
> > a setup, that's the parts that I'm really trying to unify. We need
> > to document what is expected in the CNI configuration, and then
> > control it via a distro/image flag such that it won't
> > clobber/conflict with other CNI users. I can take care of that distro
> > part, but the documentation would be ideal in a README that comes
> > along with the recipe.
>
> That also sounds like a good plan. I am not relly sure what text to
> write in that README file, though. But I guess that is something that
> can be iteratively created.

Absolutely. Just a stream of thoughts is fine for now, with a quick
overview, and perhaps a guideline on how to build a single node
system ? With a few notes about what is configured out of the box
and what we expect the end user to continue to configure / customize ?

That would be more than enough as a start.

Bruce

>
> > As I said, I'm still working through some of the factoring out and
> > de-duplication, but there's some things in there that are best done
> > on your end, versus mine.
>
> Excellent!
>
> BR,
>
> /Joakim



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
