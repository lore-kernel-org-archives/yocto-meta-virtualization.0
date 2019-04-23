Return-Path: <kbassford@apertussolutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E153E00AC5; Tue, 23 Apr 2019 07:31:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [135.84.80.216 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 2707 seconds by postgrey-1.32 at yocto-www;
	Tue, 23 Apr 2019 07:31:24 PDT
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F1C2E0033D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Apr 2019 07:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556027176; cv=none; d=zoho.com; s=zohoarc; 
	b=Owh/TG7h/7inuwPWGYFuPGL6FcblM+clCySjRR0eg/lElDjnVy1p+9r7dFtdOHsOpBI7ufFyufjBJWdcTS3NAVMmdLpyt9SAnBq9Gq5x43uc5zokwxqhGIihJZps3+ByW92zBUPkXYen9hBfUWAxv641x5hE8ZKz2sg+zDe8NZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556027176;
	h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=nl/EEYq7M+bs+js7aFTluw1DuxdQFrYEgPORVpc2Z4U=; 
	b=OFc1ILjqoL9D2GrTzkYThftDoOT4B/yCx2QMALP8ohCjmJ0oZ596VEUYteFLpq0FPkvAg6JfzEnpMg0zsrJKcVkIj4qN3hbRXoY3TgjoW0hYr5Tmsq5o6VM6C9S4xkTNN2m3n6kDrXzy+EsC999FvPo7qSIL5vB9VCwufx2qQiI=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=kbassford@apertussolutions.com;
	dmarc=pass header.from=<kbassford@apertussolutions.com>
	header.from=<kbassford@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1556027176; 
	s=zoho; d=apertussolutions.com;
	i=kbassford@apertussolutions.com; 
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=741; bh=nl/EEYq7M+bs+js7aFTluw1DuxdQFrYEgPORVpc2Z4U=;
	b=HX/2vAtmtX2yOvK5BbnYa7rHUWUMey6B0t+s6Z+3WBahSFAh+ZRPFrsIVM7FaR/p
	WRrQBzh5JjDVpIzBJSUxEKdMC8NjqCXaoG/O2HQprZ1KPgafLhMhr24BH+gcllhqZS9
	0RRVZplsmxGuxUarsSaBQGMsEqtiZBOZSyDp+zkk=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1556027174413298.7537071967049;
	Tue, 23 Apr 2019 06:46:14 -0700 (PDT)
Date: Tue, 23 Apr 2019 09:46:14 -0400
From: Ken Bassford <kbassford@apertussolutions.com>
To: "meta-virtualization" <meta-virtualization@yoctoproject.org>
Message-ID: <16a4a726e0c.108895fa735894.3116322584750949290@apertussolutions.com>
In-Reply-To: 
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: Problems building under go.
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
X-List-Received-Date: Tue, 23 Apr 2019 14:31:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello Folks,

I am currently attempting to bring in 16 Go modules ("kmip-go" plus all dependencies) into my OpenXT project and a select few are having problems compiling.  The modules that fail, fail during do_compile_ptest_base with a "vet config not found".  I have attempted to use the PTEST_ENABLED_${PN} = "0" or PTEST_ENABLED = "0" flags to no avail as these settings are being ignored.  The modules in question are "github.com/mattn/go-isatty" and "github.com/uber-go/multierr".

I am hoping that one or more of you in this audience that are familiar with compiling golang modules in a OpenXT bitbake environment might be able to point me in the right direction.

Thanks in advance.

Sincerely,
Ken Bassford
Apertus Solutions


