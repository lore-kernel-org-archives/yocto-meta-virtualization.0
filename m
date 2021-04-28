Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.6551.1619577699969873735
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 19:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ab+eiqxA;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n2so92303510ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Apr 2021 19:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mBLj//x0NzHHU5J44Nvnd/KVe2tgR/B92SizgEBTQCA=;
        b=Ab+eiqxAi8+mPp67/4CK/o4HgkYIPdalrPh008JvVxEPeCghbt0bBKfMw/MtxH5aVN
         VhROEowk+K3A/7ZQIn5GaFotia/6Pf9vbLhXTCTIZZzhH+jmhh0q3Tii0abxr2p+nq9w
         I7LXXl1+ThZnoHoJOi7PK9WcPVVheVdWxyKV9HuiWrWryo9aowBQEasDyEa2GnsaGHcU
         6S1JgOg++wAinNCFBWlVVkAzSJZmEtwk1JpsZE0dNInV7xwsH/Vmd2drZd3kx17YTTk8
         yeii+CuVlKysiMS7MUMw20LKZ5s4QAk4yAKxmOhGXub7jiFhCNkS5FegEAMru1d8HZ2w
         4iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBLj//x0NzHHU5J44Nvnd/KVe2tgR/B92SizgEBTQCA=;
        b=l4liqEekbuPAmM9/TBuY1YadKhn8bKEP+ilnuj0Lp/w2hcl+/eSEiQML3dFWLcaU5p
         EFuaImBHtzzQmaBPG8B1UkuDbI9kgJozDG4z65qDNih+UaE2VCN1D+beC6SzU3Z+/DJs
         KojhCUZNlAZjUghqI7I3yPGiP0eLw7jWtpcKUZG/NHE1EIJXkgEJS1xF8T61QTAxxLyB
         RPQvJpxrk20thPpJzoHxUTJSTKkc7BsJqbh+il8uzODStMbvPSZTe6sMyHifmrxxIOfy
         edYGUl7BNZWV0KSaITKZidMytXosiTXwCh7DW0c7TKy/ygAKgF/PRK3i4eY7eXlPqSy0
         9OyA==
X-Gm-Message-State: AOAM533aczZYP54ZorW99NNr/7zOUNDnHcmJ/Ka7aSJBMREcGaNn9GIx
	FxirllrW/mNd5+KJcTIYa5Dqv+wDLC8/fsxELcA=
X-Google-Smtp-Source: ABdhPJzoyyV6CeLCV1m/2jddymOBjPEPrB4n9+yDb7XKjHhzia+eVU05htdJzG58fTvc9Tm8bfMCaLFxlTLvuMPNAGY=
X-Received: by 2002:a17:906:2b8c:: with SMTP id m12mr19799108ejg.22.1619577698433;
 Tue, 27 Apr 2021 19:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR11MB42022546C341761BE3193E74FF419@DM6PR11MB4202.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB42022546C341761BE3193E74FF419@DM6PR11MB4202.namprd11.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 27 Apr 2021 22:41:27 -0400
Message-ID: <CADkTA4Otjn5uujw4Am89nsxPjAroTHVFUw1X-Ai73wq6YZeMYQ@mail.gmail.com>
Subject: Re: Help on openvswitch
To: "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 2:54 AM Zhang, Qiang <Qiang.Zhang@windriver.com> wrote:
>
> Hello Bruce
>
> when openvswitch enable DPDK, the do_configure will trigger follow error:
>
> checking whether dpdk is enabled... yes
> | checking for rte_config.h... yes
> | checking whether RTE_LIBRTE_VHOST_NUMA is declared... no
> | checking whether RTE_EAL_NUMA_AWARE_HUGEPAGES is declared... no
> | checking whether RTE_LIBRTE_PMD_PCAP is declared... no
> | checking whether RTE_LIBRTE_PMD_AF_XDP is declared... no
> | checking whether RTE_LIBRTE_VHOST_NUMA is declared... (cached) no
> | checking whether RTE_LIBRTE_MLX5_PMD is declared... no
> | checking whether RTE_LIBRTE_MLX4_PMD is declared... no
> | checking for library containing dlopen... -ldl
> | checking whether linking with dpdk works... no
> | configure: error: Could not find DPDK library in default search path, update PKG_CONFIG_PATH for pkg-config to find the .pc file in non-standard location
> | WARNING: exit code 1 from a shell command.
>
> I didn't find out why,  have you repeated the question?
>

I have seen this with other packages in the past, but can't find the
references to specific fixes now.

Have you looked to see if dpdk is in fact producing a .pc file ? We
kind of overload package config in OE where it is a general set of
options for recipes, and also the actual pkg-config application (that
needs those .pc files).

A quick check shows that openvswitch isn't inheriting the pkgconfig
bbclass, which means our pkg-config-native isn't in the dependency
chain.

I'd start there.

Bruce

> Thanks
> Qiang



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
