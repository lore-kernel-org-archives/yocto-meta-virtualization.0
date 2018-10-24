Return-Path: <kbassford@apertussolutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8ED7BE00901; Wed, 24 Oct 2018 05:38:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23F3AE003DB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Oct 2018 05:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540383806; cv=none; d=zoho.com; s=zohoarc; 
	b=IqegB6tSwBk2widJQkmieOoRqfjQxD9WszL9A6wULBZSD4et0rPjAgs1Nmd6sTbzdu4hoK+0Ya4Bj1zRd+1cKMqe7+Ikuxo56EajDB9JC+suZOCiUWxAKaOwCoOTf3HlR3DNaAQydHtbVDRAISLAKCjIJdM4As50Ufl1zqJwzxA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1540383806;
	h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=VJdIfBJWz+o5vN+TYwXB96YBJGv+4kFBTQruDrcjQ1Q=; 
	b=gh516xETmiVYESzTIdp2fIA4P0kTIFCldbvRU1GyugnQ6/JR0W8OzZOhFYdyG/Q2s+BOuvZ1vXQAkC4eTgt53PmH/XW+GZRsv2qwR2UrJ9nOidGT6oJzDhM+7fsGXaKDJE4EEcswV99F5EnysHIOkeJdbEftGEnvm/PeLh1NPKA=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=kbassford@apertussolutions.com;
	dmarc=pass header.from=<kbassford@apertussolutions.com>
	header.from=<kbassford@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1540383806; 
	s=zoho; d=apertussolutions.com;
	i=kbassford@apertussolutions.com; 
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=245; bh=VJdIfBJWz+o5vN+TYwXB96YBJGv+4kFBTQruDrcjQ1Q=;
	b=ZMqQwXxTPdf41ntOTj/jfmHyL4OTfCBDReIrzXRaabX+zzRUEABOACfK1O5XbLpe
	jcTofdlpDTJMmAqL5U3+aYjwT8N/mVtk6TPEvkmVqgykT4qbiDG5ILbnOtXvDAXtsdm
	QTdhzAWDvAPUFfqRpHo4ipOqYtyq/ngcj16JVWHE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1540383806212555.0517889495414;
	Wed, 24 Oct 2018 05:23:26 -0700 (PDT)
Date: Wed, 24 Oct 2018 08:23:26 -0400
From: Ken Bassford <kbassford@apertussolutions.com>
To: "meta-virtualization" <meta-virtualization@yoctoproject.org>
Message-ID: <166a6079303.1297673dc216316.6956627667811449271@apertussolutions.com>
In-Reply-To: 
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: Bug 12968 (yocto bugzilla): SRC_URI change in seabios recipe
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
X-List-Received-Date: Wed, 24 Oct 2018 12:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello Folks,

Once again the SRC_URI has changed in seabios_1.9.1.bb ...

-    https://www.seabios.org/downloads/get/${PN}-${PV}.tar.gz \
+    https://www.seabios.org/downloads/${PN}-${PV}.tar.gz \

Sincerely,
Ken Bassford
Apertus Solutions



