Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.58.1609882294402575991
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 13:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F19eeziA;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id q22so2506849eja.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jan 2021 13:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jvX9Rbn7Zp97bVFopI/ezfE2QTyRNAQFGqKzPeNmRjw=;
        b=F19eeziANwhbXKowsQ881BbjH4vsbGhjw4w+wnxDrTygwxepESdUnKGOl4SiHBpQ4w
         xsm3ECeRRZ1yAO7EqrVJy1JimhQOoii1kQrt2aIsq7qq8wAU+0Cu6gxASQxTYjgSa7E8
         EkQzqRN2GRh0P8S7DZoHqHyh10cLRbbK0Bnfk4TG38SobYTq5oMC3l0DlYEwunZRDf4A
         zlSAkhwfa+aDuTkQPQ8YwDetEGTE+QSAOydQMPF7eOzhX1fkO6crv4SBgmWjb3DnmSkK
         5H9WKN0vpQBdXQdXPXCaT+sGexMwtO53np55OpdzDx0C+C01NymNKYvGciS++41+nG1S
         8VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jvX9Rbn7Zp97bVFopI/ezfE2QTyRNAQFGqKzPeNmRjw=;
        b=tsUqiKhAothUhYxY+k3AewBtoR4eXuB0Z+XljW2i49pekQOim78E663joCbSeZIZi8
         /C0LbhQn93offfa819CgaGnx9Od8tRPz/wwEz5Hntzn7/Ya8wtRlc7jwyeIxoAQocG3g
         VZ+Tmj7spWlEfkihOVkd6TgThDQYTzwe+mlxmsVE7TvB5bcZmQf5dOVZtUn/uE/EtTlA
         UXSwOEmZTnFRAH+T6BYEt/IYxeP3l/ms8HTHfHsewlQvK8WnOOAa+s0d+DmIjb+8LmIN
         bKXOAEgDTCBWTyCKlByyyopY7GVUi3/CaYFGY2kwhzDTlrGs1wR/mcC0I19kpMN1wMne
         AyIw==
X-Gm-Message-State: AOAM533Vk72LRcnwHbfyLsVe8UcIlUVrUGHyyIsH9ZHfUxDQnAoHDl5P
	lI80j2o5gs+6gMbSqarFSegnkd7FoNVlDCMDfsE=
X-Google-Smtp-Source: ABdhPJwruVdTjsFL7O+dJVLzu7i2JGFuZeKyPvnuof52Fep/vbzhVEG7s1SZmCdnhXiBaxrFZVMRqNXwLF1XqIU2yPk=
X-Received: by 2002:a17:906:6448:: with SMTP id l8mr894385ejn.357.1609882292822;
 Tue, 05 Jan 2021 13:31:32 -0800 (PST)
MIME-Version: 1.0
References: <aee11c2c-09f-1c4-3a0-13b1b2338030@crashcourse.ca>
 <CADkTA4Nf59A4F_JrPOtv77FK57nNEVjEvirhuegmWc=WwJzyhQ@mail.gmail.com> <aceeb927-56eb-f93d-cdc3-9d9c3643dcdf@crashcourse.ca>
In-Reply-To: <aceeb927-56eb-f93d-cdc3-9d9c3643dcdf@crashcourse.ca>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 5 Jan 2021 16:31:21 -0500
Message-ID: <CADkTA4PCtpvTE6+GeWgPtBzMXkk9NK5pSuCjem4a3GtrAwtshw@mail.gmail.com>
Subject: Re: [meta-virtualization] what is the state of meta-cloud-services, re: chef/puppet/ruby recipes?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 2, 2021 at 3:07 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Sun, 27 Dec 2020, Bruce Ashfield wrote:
>
> > No one has done much with the ruby support in quite some time, so it
> > would need work as well. I thought there was a meta-ruby floating
> > around, but I couldn't find it on the layerindex, so it looks like
> > just oe-core + some work would be required.
>
>   random thoughts after messing with various aspects of ruby for the
> last couple days.
>
>   first, would it not make sense to move the ruby.bbclass file to
> oe-core? given the fundamental nature of ruby.bbclass, it seems
> inappropriate to have it in a specialized layer like
> meta-cloud-services. if oe-core has class files related to things like
> perl and python, it would seem like ruby.bbclass belongs there as
> well.

It is a possibility, and was considered in the past. But oe-core
doesn't currently have any ruby recipes (just the toolchain), so it
isn't common enough for core. We had a lot of ruby in the openstack
world, so the extended support was created there.

>
>   also, i had to hack ruby.bbclass given the python 3 distinction
> between strings and bytes in order to get some ruby variables to be
> set properly:
>
> diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
> index 15ac9f4b..585d128d 100644
> --- a/classes/ruby.bbclass
> +++ b/classes/ruby.bbclass
> @@ -26,7 +26,7 @@ def get_rubyversion(p):
>      version = subprocess.Popen([cmd, "--version"],
> stdout=subprocess.PIPE).communicate()[0]
>
>      r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
> -    m = r.match(version)
> +    m = r.match(version.decode("utf-8"))
>      if m:
>          found_version = m.group(1)
>
> @@ -44,6 +44,7 @@ def get_rubygemslocation(p):
>         return found_loc
>
>      loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
> +    loc = loc.decode("utf-8")
>
>      r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
>      for line in loc.split('\n'):
>
>   i'm sure there's a cleaner way to do that ... i can submit that, but
> i'm not sure which ML to give it to.

The change should be good enough, that's the typical python3.x technique.

This is the right mailing list for any changes.

Bruce

>
>   in any event, i'm still beating up on ruby, and it would be nice to
> formalize how to get this organized.
>
> rday



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
