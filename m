Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7931.1623756675871381779
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 04:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EctRAflP;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1623756676;
  x=1655292676;
  h=to:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=NA/smacPkpehtm78pdhUdK58PmokmFodk9OFPEsgXXE=;
  b=EctRAflPHyqOz0VuDblM5zJyqfF8HcM7bxihr14eAaFXdYRV1Q2yMtfM
   +xq/O21EAPwcvjG+GwaHOBIvnbc0PS7ysvCmV86bQK8Hf9104IOdJgCmJ
   yHBE3VeIOwM5WEWn6+fbOwDuzFCmgdGAibnEpuhFfVpzDFnRxPNIrBNkW
   DPBgrwNEPitvTERGv8WXZVfxV1wa1h9vV62hVPAHX2f2I4k1B0eeOe2uz
   262nxi9IOOupUDZ6Xkp6OI4Z9cjubj4ZQPZjz9zSBs3i6xaNgQZl7bOXT
   toDwCYxUdpE171d/TJys7eZaYkDzrc/sfDhZN9DmszeJp6f3WNEHgT1sf
   A==;
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Subject: [cni] do_compile network issue behind proxy for Hardknott
Message-ID: <b345fed3-bf43-178e-70b3-6f3bacdbbb65@axis.com>
Date: Tue, 15 Jun 2021 13:31:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi!

After upgrade to Hardknott from Gatesgarth, building cni on a machine 
behind a proxy gives me network errors:

run.do_compile.18062' failed with exit code 1:                      go: 
github.com/onsi/ginkgo@v1.13.0: Get 
"https://proxy.golang.org/github.com/onsi/ginkgo/@v/v1.13.0.mod": dial 
tcp 142.250.74.81:443: connect: network is unreachable

The command that fails is

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-networking/cni/cni_git.bb?h=hardknott&id=6c9b889224cedd42191ef5edc7e1f37b0c8ecfec#n37

and can be mitigated by explicitly setting the proxy environment 
variable on that line:

http_proxy=http://<myproxyserver>:<proxyport> 
https_proxy=http://<myproxyserver>:<proxyport> ${GO} build

Since building with Gatesgarth (where that line is the same in the 
recipe, but the cni version 0.7 instead of 0.8) worked fine I did not 
expect this to happen. Do you guys have any ideas? (Setting the 
environment variable as describe above does not strike me as the 
proper/best solution...)

BR,

/Joakim
