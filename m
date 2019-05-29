Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D508CE00D00; Wed, 29 May 2019 05:47:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.180 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9255E00BE9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 05:47:48 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id w1so2346490ljw.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=TsHgm9Ig+VGig/2PICLVfKwznl+U5bMFi7VC+VuU77A=;
	b=N2EhV+4DboI4wJ7JfH3bR6U8nTN9ABQTtsbt0/cOjl7YoR6f+kZJIf2WG/JJP2Jzcp
	rt6yZxG//5V4JHc3qWYWzLSEWVqz2R2DHKfj5uIo9yyOJZewwtYsNcZKJxit1rOfuDnn
	cxBxK5ysTxQ8rMB4T/L9hzmUFFXxQlwAweHjEqVzv6eVPnO/1e+gBFFVpVrhlOwFUXem
	hC3uyp6XEUDMwHwUNQNOgkStLHGtALL4Cz/cdB6O4A0EHmXQ3a4GLxJNS/vCOkAQLzv2
	q+IA3JuMoAb/5DFIFH0fC/RVCA8IaKMHXgaZy916MvNLrRrozurK7QE1JCYqD6wbVD+2
	y0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=TsHgm9Ig+VGig/2PICLVfKwznl+U5bMFi7VC+VuU77A=;
	b=GhWXZGILK80K/gE9CG15aYTLdThdrqA7yy8U62DgSZ/qkLl3169f2AZVP3c9rpRtz+
	Xd9yA2O+E7zp1vSa0JmCmz7jQr+UwK6Rc1CphgQpzKjLJf83QFOk9qMJ/PBRP3xQvifa
	G/W/iWEXjncnydmpn7BJ3UwHW2W1tXkgf+Zs1IgIBpAeqlu894tlEq0ot6yBlyIjd0hF
	m5k3TITDKE05f+IG5muZms6uG1xnQg6GgsYfHWWOBRa83d6EAZ+skdMjkCDJcytjStiG
	8oOXMjOiJ3SOOTysNXuU5SBqPPGvJvAQ15DjIZdf5xxMwmrOCbu6cHzbgnJ1NLD6/3zt
	BdkA==
X-Gm-Message-State: APjAAAViNOBj6ELaJDGHoMmEOzT3RsPwVWF7bqwrOn/MLunv9pVdra05
	8o9AXiy67QhxXhlNLNpWbONK3YyGJ/KfwLhD0Ji/b6kk
X-Google-Smtp-Source: APXvYqysOIjoM3MrL86QjAeKp7MWGRs3H+EPGZbWNrNHvUr92LosWR0gT24aJpgfo1zP4GOoIoQ8+vKrf2UbvRwtyZU=
X-Received: by 2002:a2e:9989:: with SMTP id w9mr16043981lji.219.1559134067279; 
	Wed, 29 May 2019 05:47:47 -0700 (PDT)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 May 2019 08:47:36 -0400
Message-ID: <CADkTA4NH3kLuDvpkUbj9VHmtTpAQ8zfRH9A3ctm32cHLvCK5ew@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Heads up on package uprevs dropping in master shortly
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
X-List-Received-Date: Wed, 29 May 2019 12:47:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I just wanted to send a quick heads up that I'm finalizing uprev's for
meta-virt master for the core container components (runc, docker, k8s,
etc) and I wanted to do a quick survey to see if any users have
specific version requirements on any of those components.

If there are some stability points that need to be preserved (and
while also tracking master for some things), I will leave some of the
existing versions in place when I do the version bumps.

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

