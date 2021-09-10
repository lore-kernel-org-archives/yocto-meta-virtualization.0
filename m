Received: from mx01.optimcloud.com (mx01.optimcloud.com [46.23.89.156])
 by mx.groups.io with SMTP id smtpd.web10.6299.1631262883431559642
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Sep 2021 01:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=PPVwNykP;
 spf=none, err=permanent DNS error (domain: optimcloud.com, ip: 46.23.89.156, mailfrom: yocto@optimcloud.com)
Received: from mx01.optimcloud.com (localhost [127.0.0.1])
	by mx01.optimcloud.com (OpenSMTPD) with ESMTP id 78db3cbc;
	Fri, 10 Sep 2021 10:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	content-type:message-id:from:to:subject:date:in-reply-to
	:references:content-transfer-encoding:mime-version; s=obsd; bh=c
	wQsRnu+5lKmC5nmy1UIzrRSq4fTNLFJmXYGzVKKCLI=; b=PPVwNykPdPONJw529
	Rexyn0K7D7h1Au0FH5skMXrC274b86Kl3STnHcs71ltchVRR2iZRUKlI+tNn9k5a
	FuoSUvVxZUKx0AuuRBB1AoXIpdnigSURHxGSL/w62H+rZ2/RD+V/oJ82DGBcoKRT
	A6rOgbT2Il8l8PEYwIjjevfZh99vFClT6QVYytdg7n8t+US7m0ZnX4spRRS5fxqS
	WmaxYw9i9Q4wxVeLPs1FNOXG/UYE22o4M3JedwWtAIv3ZnSR0BpvAQe0ymq/3NFF
	NHVro4KfjoSuhuGhxaszivzpBq+LX+lDn7V6G/wuV6+kP7SuBxnNIeNR7I+Fg8jv
	VzL8A==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=
	content-type:message-id:from:to:subject:date:in-reply-to
	:references:content-transfer-encoding:mime-version; q=dns; s=
	obsd; b=R4lehnk3MOBzI+Z82iGQb/mnhb8dpjIV/ER8qSNeq6rxywUDmXqTtMQ9
	vtO7+dLesMVwm95UcqtNlw4BlKe3ZOYa3fHG+YPw/ok493l/8/u9ZsSFVIOuS/cf
	ChIVoqPybzqi9UvFpiyJww3bT+gDmho6nMOPN3U06PvAWuycnvmj3YLQk1yrKlHX
	IYa8V6wCuR/48LYXBr0gd/+ekiWm5E3Wi1BVQqszkAQCLolTnMnF7ILwE11RyQhi
	dV4CfapGbneJ/Sbcp13xZiwvW1OsgCe+ZTdOtKfcZFjKIBUqwQW9Zw3XKJIWDS5V
	FwZOxnDn8t0djCLE3Uiw0gk5h4S6Yw==
Received: 
	by mx01.optimcloud.com (OpenSMTPD) with ESMTPSA id 3030359c (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) auth=yes user=yocto@optimcloud.com;
	Fri, 10 Sep 2021 10:34:37 +0200 (CEST)
Message-Id: <1631262707367.2520628917.514655614@optimcloud.com>
From: "Yocto" <yocto@optimcloud.com>
To: Joakim Roubert <joakim.roubert@axis.com>,
 meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] thoughts on k3s and supporting builds of more than one k8s version
Date: Fri, 10 Sep 2021 08:34:31 +0000
In-Reply-To: <729c3f470eb64e3a8832e3e70c8da768@axis.com>
References: <729c3f470eb64e3a8832e3e70c8da768@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On Friday 10 September 2021 13:49:24 PM (+07:00), Joakim Roubert wrote:

 > Hi!
 >
 > I was thinking about k3s, and now that the latest stable k3s is a 
Kubernetes 1.21 version:
 > Do we want to have recipes for multiple k3s versions? I'm thinking 
someone perhaps wants, say, 1.20 to go with a system with 1.21, while 
someone else perhaps wants 1.21 to go with 1.21 components.
 > And then have a common .inc-file with everything that is not individual 
for the versions, and small recipes with the source revision and such for 
each version.
 > What are your thoughts on this?
 >
 > BR,
 >
 > /Joakim

I would rather see KubeEdge packaged then another specifically k3s, which 
well i feel is pretty useless overall as kubernetes itself does the job
kubeedge provides more benefit to low resource edge nodes then k3s 
mini-kube would.


 >
-- 
Sent with Vivaldi Mail. Download Vivaldi for free at vivaldi.com
