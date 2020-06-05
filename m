Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.252.1591385469487907052
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 12:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j7W2W6wo;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id c14so10892868qka.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2020 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xim+j1ksb664deAxVz/q43nyIILrJn9sJX3egyBw/O8=;
        b=j7W2W6woFiZHmbRWpdCNDQ42bz1Ff10lAU2nHTF8Ml57g9NHY5IKOxrcLA1q2vvjU0
         0iKgNDiqEi+swdpJ92ISnCE4PFtLYzR8xNvGflpNbK2wUfKN4gHIHxA4VuHqAJvFAfTy
         wmQw4d/lOsfFLsGEjWI0cvdlQqFM81qaLA4SlIIRc0iIToRa5iM9wDouuyqg608cRven
         G1Bg6aE1FH9zBJgeWMbu4NV0R+KDpeT74AqTSKQVcjSRvEw7DNNFvmrGl199ab5b5/E8
         kysWo8Ra5G4YjhP30S+UUt5An6jl232wXueSlkpRqG1f3E0duHUyXQNpgbIP74D6wovh
         3Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xim+j1ksb664deAxVz/q43nyIILrJn9sJX3egyBw/O8=;
        b=oNqRLnCcW842+eihEOBnDsdBBMj47U6e40BZU3aSdWHvqAnH/Es+PjCrZVi/MzR6RT
         +4kA60bOkxC+P5D8qB+YtXq548xKrOhMgtP2AbMzpvrZa8o9FUSEyj4MfqXS0j7OQpAh
         4MhrxrTqqV4mbEkOBVUq34PWBAX1pO8vVjCTbIvI8TjiheuoO2NKNpl0kdX7+aslnJmy
         MjkED8bWedMLpUMtwJ4s8Lv7lbyn+02jXs011qirbxIhRLDU2dTN0TLd+C4FdPB3ZC2+
         O9n2OHI6/KxOd5FUfV37l1xiO4vSQiVaPD1tPQ2FTQKVhmR5H5cW7iZ4f1L+fl5Cqi3R
         RERA==
X-Gm-Message-State: AOAM533Eu7GD7GJNfduxf3QBHOOIPCY7eBT7MoU8RrpRavjNiHEQpgst
	vnWDB6u5p79taRFgNyH2MPY=
X-Google-Smtp-Source: ABdhPJybPUK53KfjaevL/QxmV0effv1vsSi+oIM9k/alfrfxZo0TYtHBWwRZdAsr8uW/u5uVdcrkSA==
X-Received: by 2002:ae9:e895:: with SMTP id a143mr11737461qkg.359.1591385468552;
        Fri, 05 Jun 2020 12:31:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id g5sm671679qta.46.2020.06.05.12.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 12:31:08 -0700 (PDT)
Date: Fri, 5 Jun 2020 15:31:06 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Babak Sarashki <babak.sarashki@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, zbsarashki@gmail.com
Subject: Re: [meta-virtualization][m-c-s][PATCH 00/34] satisfy setup.py setup_requires
Message-ID: <20200605193103.GA57318@gmail.com>
References: <20200602185427.36627-1-Babak.SarAshki@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200602185427.36627-1-Babak.SarAshki@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][m-c-s][PATCH 00/34] satisfy setup.py setup_requires
on 02/06/2020 Babak Sarashki wrote:

> I need these patches on warrior. Let me know to redo against warrior if not relevant in master any longer.

I've merged them to master.

There was one conflict in warrior that I resolved. Have a look and submit
fixups if required.

Bruce

> 
> *** BLURB HERE ***
> 
> Babak Sarashki (34):
>   python-automaton: satisfy setup.py setup_requires
>   python-barbican: satisfy setup.py setup_requires
>   pythin-castellan: satisfy setup.py setup_requires
>   python-ceilometer: satisfy setup.py setup_requires
>   python-cinder: satisfy setup.py setup_requires
>   python-cursive: satisfy setup.py setup_requires
>   python-glance-store: satisfy setup.py setup_requires
>   python-glance: satisfy setup.py setup_requires
>   python-glacnestore: satisfy setup.py setup_requires
>   python-heat-cfntools: satisfy setup.py setup_requires
>   python-horizon: satisfy setup.py setup_requires
>   python-jsonpath-rw-ext: satisfy setup.py setup_requires
>   python-microversion-parse: satisfy setup.py setup_requires
>   python-neutron-lib: satisfy setup.py setup_requires
>   python-neutron: satisfy setup.py setup_requires
>   python-nova: satisfy setup.py setup_requires
>   python-openstackclient: satisfy setup.py setup_requires
>   python-openstacksdk: satisfy setup.py setup_requires
>   python-os-brick: satisfy setup.py setup_requires
>   python-os-traits: satisfy setup.py setup_requires
>   python-os-vif: satisfy setup.py setup_requires
>   python-os-win: satisfy setup.py setup_requires
>   python-os-xenapi: satisfy setup.py setup_requires
>   python-oslo.privsep: satisfy setup.py setup_requires
>   python-oslo.rootwrap: satisfy setup.py setup_requires
>   python-oslo.vmware: satisfy setup.py setup_requires
>   python-oslotest: satisfy setup.py setup_requires
>   python-pypowervm: satisfy setup.py setup_requires
>   python-rally: satisfy setup.py setup_requires
>   python-ryu: satisfy setup.py setup_requires
>   python-swift: satisfy setup.py setup_requires
>   python-taskflow: satisfy setup.py setup_requires
>   python-tooz: satisfy setup.py setup_requires
>   python-trove: satisfy setup.py setup_requires
> 
>  .../recipes-devtools/python/python-automaton_0.8.0.bb      | 5 +++++
>  .../recipes-devtools/python/python-barbican_git.bb         | 5 +++++
>  .../recipes-devtools/python/python-castellan_git.bb        | 5 +++++
>  .../recipes-devtools/python/python-ceilometer_git.bb       | 5 +++++
>  .../recipes-devtools/python/python-cinder_git.bb           | 5 +++++
>  .../recipes-devtools/python/python-cursive_git.bb          | 5 +++++
>  .../recipes-devtools/python/python-glance-store_git.bb     | 5 +++++
>  .../recipes-devtools/python/python-glance_git.bb           | 5 +++++
>  .../recipes-devtools/python/python-glancestore_git.bb      | 5 +++++
>  .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb  | 5 +++++
>  .../recipes-devtools/python/python-horizon_git.bb          | 5 +++++
>  .../recipes-devtools/python/python-jsonpath-rw-ext_git.bb  | 5 +++++
>  .../python/python-microversion-parse_git.bb                | 7 ++++++-
>  .../recipes-devtools/python/python-neutron-lib_git.bb      | 5 +++++
>  .../recipes-devtools/python/python-neutron_git.bb          | 5 +++++
>  meta-openstack/recipes-devtools/python/python-nova_git.bb  | 5 +++++
>  .../recipes-devtools/python/python-openstackclient_git.bb  | 5 +++++
>  .../recipes-devtools/python/python-openstacksdk_git.bb     | 5 +++++
>  .../recipes-devtools/python/python-os-brick_git.bb         | 5 +++++
>  .../recipes-devtools/python/python-os-traits_git.bb        | 5 +++++
>  .../recipes-devtools/python/python-os-vif_git.bb           | 7 ++++++-
>  .../recipes-devtools/python/python-os-win_git.bb           | 5 +++++
>  .../recipes-devtools/python/python-os-xenapi_git.bb        | 5 +++++
>  .../recipes-devtools/python/python-oslo.privsep_git.bb     | 5 +++++
>  .../recipes-devtools/python/python-oslo.rootwrap_git.bb    | 5 +++++
>  .../recipes-devtools/python/python-oslo.vmware_git.bb      | 5 +++++
>  .../recipes-devtools/python/python-oslotest_git.bb         | 7 ++++++-
>  .../recipes-devtools/python/python-pypowervm_1.1.10.bb     | 5 +++++
>  meta-openstack/recipes-devtools/python/python-rally_git.bb | 5 +++++
>  meta-openstack/recipes-devtools/python/python-ryu_git.bb   | 5 +++++
>  meta-openstack/recipes-devtools/python/python-swift_git.bb | 5 +++++
>  .../recipes-devtools/python/python-taskflow_git.bb         | 7 ++++++-
>  .../recipes-devtools/python/python-tooz_1.48.0.bb          | 5 +++++
>  meta-openstack/recipes-devtools/python/python-trove_git.bb | 5 +++++
>  34 files changed, 174 insertions(+), 4 deletions(-)
> 
> -- 
> 2.23.0
> 

> 

