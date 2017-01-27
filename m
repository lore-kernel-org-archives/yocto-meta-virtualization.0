Return-Path: <kevron.m.rees@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA3BEE003DB; Fri, 27 Jan 2017 08:36:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.178 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.178 listed in list.dnswl.org]
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A819FE0030B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jan 2017 08:36:39 -0800 (PST)
Received: by mail-ot0-f178.google.com with SMTP id f9so201217301otd.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jan 2017 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=EeA1rsS+loT9/J3yZ9Swn+XH9Ul69VGUj885TVKk6TU=;
	b=Ob0RujQfX46KKuSKUGLeTALjMFXA1hVo/2jUG+mnNMs17vXd0iaGgIc2zOD1tOw0/v
	+pCWz74kYjM5SeW2w3MmKh8U2zdlBmhp6Z0f2ptpYShZpOYEZ4guYPhadR/j8LM+fBHH
	8R2+2p4jy6pxD8lHWJ4rMUHeNRTi3zuoB78OBB39XLD7gZPbeJEi5GtbmjKULX9T/dlf
	o+2M+/vTIq8/YM+c3pRZnvkW+9aHNvKErvf+vYNzRDBuCLlojZwoRtZ34eRsr8YmryHJ
	RK7NEWNOdwVO+v9MsI69zXQleSwqsMyeH6/SNttwpJnouYktw5J9Rk59pFgkHBEXstII
	lslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=EeA1rsS+loT9/J3yZ9Swn+XH9Ul69VGUj885TVKk6TU=;
	b=X0ooFvyaadDuiPD8WFGk4rZQyaWAEqCzYOppqSQLZS7etAL719aiKKrUpkVCy86h/0
	fJOymPLw3nm1/RB3eBk6a6RhqQUwAbj+xjQXMfFlI5USsJbAx324SBik4KGtGpGr1yr5
	9t0qQ9mLTTJZWklRT+peWht/UJXrt3z+RljiNyz8eBSMJJRRj/rfWF7oNndwkiWQbUnQ
	kOwExcgJAvcbAAy/l8tEK4FoTAU5wjmAvqG4sQO/W4VdaMXlksYQD3F89NDk0WL5Khut
	ElCyOFn4pvZ4HTHqRmHSnPXj4xA1CdmDSIsxAOhvZjN9EHi6UNPveh7bHgMFHNLXq1/5
	0xhQ==
X-Gm-Message-State: AIkVDXKVmPoS8xGuo1D1li8YnQSsTw1bQoOVJndOPPsFMc5IydPUL7G/PQ7EuMYI9Ly+RdXNUGZdq9Cse8dgYkDF
X-Received: by 10.157.62.203 with SMTP id b69mr4121007otc.30.1485534999112;
	Fri, 27 Jan 2017 08:36:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.39.199 with HTTP; Fri, 27 Jan 2017 08:36:38 -0800 (PST)
From: "Rees, Kevron" <kevron.m.rees@intel.com>
Date: Fri, 27 Jan 2017 08:36:38 -0800
Message-ID: <CAFW5wYbS2P61xOMy0rpOJzYXwPfXdLBO=CUdLG6D_GfT51dd6Q@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: using lxc-create in yocto environment
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2017 16:36:46 -0000
Content-Type: text/plain; charset=UTF-8

I'm trying to call "lxc-create" to create an unprivileged container
within the yocto environment.  I am using a config file containing
uid/gid mappings that seems to work on my host system:

lxc.include = /etc/lxc/default.conf
lxc.id_map = u 0 100000 65536
lxc.id_map = g 0 100000 65536

The command I'm using in my bitbake recipe is as follows:

lxc-create -l DEBUG -o muhlog.lob \
              --config=${S}/default.conf --lxcpath=${S}/var/lib/lxc \
              -t download --name=safety -- -d ubuntu -r xenial -a amd64 \
              --no-validate

"${S}" points to my working directory that has default.conf in it.

The output is as follows:

| DEBUG: Executing shell function do_compile
| newuidmap: write to uid_map failed: Operation not permitted
| error mapping child
| setgid: Invalid argument
| lxc-create: safety: lxccontainer.c: do_create_container_dir: 985
Failed to chown container dir
| lxc-create: safety: tools/lxc_create.c: main: 318 Error creating
container safety

The "error mapping child" error comes from
src/lxc/tools/lxc_usernsexec.c:370 when calling lxc_map_ids().

Any hints on why newuidmap would fail?  I'm hoping that's the root
issue here and the subsequent messages are just the result.

cheers,
-Kevron

