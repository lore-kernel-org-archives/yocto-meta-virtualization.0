Return-Path: <kbassford@apertussolutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F22CE00BFB; Wed, 24 Oct 2018 05:38:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [135.84.80.216 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17965E00A10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Oct 2018 05:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540384711; cv=none; d=zoho.com; s=zohoarc; 
	b=X/4oh3iYtIM0BooNW+EGF4WumgaF9xgz8n9t6zreu0cqxAmn7nqVkdHm8embjYhSjz7HuXN66Q/xl0J2qnOskujRA/jLpn8wdSRH/sec7Dv4NutHQRCQ6iR6VjdkBrhLrzKHthiv3vC5U+zpgOOJ9yZx2vyCSK6vQBzMzSXwECk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1540384711;
	h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=6g0nRU1IuawDvf/Qg7y6u2zd2kMAzMiISVSnO25BsQU=; 
	b=eQFFZAFQCJPXFOKtxGUogysNodxrulPKQWbs8t9aA5hahBkXnMx8e5VaoVUXdRmKkg0ZGvYJDqiN6AiVWiNyJwuB5suFttaeigS75SPmZAC5Ka1Zmop2Xc+8Tnehc0LjmaBQlTrvBvXoMgII1Bbbl8rjpqTx0cX88rgC2vWZvtk=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=kbassford@apertussolutions.com;
	dmarc=pass header.from=<kbassford@apertussolutions.com>
	header.from=<kbassford@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1540384711; 
	s=zoho; d=apertussolutions.com;
	i=kbassford@apertussolutions.com; 
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=282; bh=6g0nRU1IuawDvf/Qg7y6u2zd2kMAzMiISVSnO25BsQU=;
	b=Kgr4Jl1pYJlBndyrbp3doi7TX1QrAj7SOySpZgxY9tJ33gJ2DYXM6H78kChxTFzd
	klVrwNZ5c8kJnEAXh09NNnBv9tYZ3b6yQTNtXHcPx5VafhxWiN9IE5czSnpXPr1lUIX
	1aku2FDhs8AHEo6g9SAaMvCuEeuTHI6yTN3Gs0OA=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1540384709282660.5140242620654;
	Wed, 24 Oct 2018 05:38:29 -0700 (PDT)
Date: Wed, 24 Oct 2018 08:38:29 -0400
From: Ken Bassford <kbassford@apertussolutions.com>
To: "meta-virtualization" <meta-virtualization@yoctoproject.org>
Message-ID: <166a6155aa1.d58a0a76218926.5313920648769418063@apertussolutions.com>
In-Reply-To: 
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: rocko: seabios: SRC_URI change, seabios_1.9.1.bb
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
X-List-Received-Date: Wed, 24 Oct 2018 12:38:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Hello Folks, 

Found in Yocto release 'rocko'. 
Once again the SRC_URI has changed in seabios_1.9.1.bb ... 

 - https://www.seabios.org/downloads/get/${PN}-${PV}.tar.gz \ 
 + https://www.seabios.org/downloads/${PN}-${PV}.tar.gz \ 

Sincerely,
Ken Bassford
Apertus Solutions



