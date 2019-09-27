Return-Path: <misla011@fiu.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F6FEE00D4A; Fri, 27 Sep 2019 16:53:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 636C2E0082A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Sep 2019 16:53:34 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id u22so3374551qkk.11
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Sep 2019 16:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=SGGxbqqMnBCPziDvgCBC1ui1tzcagZzOgjdkWzygC0Y=;
	b=FfcDM7EVA/NCgqvX4DgoSga/53FragY/LUG/RDWZVsGPfKXjrKf2LfDLt6eaZUBPrb
	Ef/6PxY0uMN0YNhFpTdln8wve1eoowWInrNiDyFx0Fi7mUCMqjBJPwa82lenTpcXYS0k
	ncES43Vvn3PFYEH0obeAq0BZRh814Z9XiIZcPUhHdAFzHo/GmsLq9hRGFR8gsWmtseDO
	dVtnuU5Mg6WIqvl322DjVOJce7fOYbxbQ58A7VLqQZVC3Z4SaWgDZrtaPpb9KMaXLZ3R
	/w+RVwIPmy+pNok738fm+dxtLbha4SDppqobsp7xfJKmUcIOyQlH8jK0XA+fZqXYNS2A
	UYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=SGGxbqqMnBCPziDvgCBC1ui1tzcagZzOgjdkWzygC0Y=;
	b=b0YeN/0PnEV5rYDmtL1xlaDNhy9D17rzrlChwnxo8oC6cAkbPuFMmNu5CWPxXUWWUL
	cs/YuCF7ePjZxnRHAxLCeqSpU2L07wnUj+DHerM+EcpLablk64yKDwBls6UGvUmNFte/
	YMThz0lwjTTLxpzRutMN99b+ZYNe9+Kwmx2vf8hJQQo5ojbrUx+ratDyRRUtd7QPZOg+
	T125fmR/ZxuJg2KR5yW9WNlzmmiXVUBasGzHftJkdltjCcwoX3PVud5o7/toRYu6rIac
	YAp3pQJTOjSJ8stym3TTqd8VdP7eVsky4DKSEldZSEhnaaerAaYLPAO5sp6zLgUjVNYZ
	cjZw==
X-Gm-Message-State: APjAAAW88eZlLp9unvUJdfoRkvfLr913nOW9Ix8L4K7/JM6goqmxly4+
	YXN+Oy4YhMiZ+aZ/6EBPv+e+ThU8hfU=
X-Google-Smtp-Source: APXvYqxwJp+Izl0SamO6siOm85UJuFnp2ItoSb07sU8A6qE8eQwR3hZ/h16OzCxXRlAjpiTB9xUQ2Q==
X-Received: by 2002:a05:620a:25b:: with SMTP id
	q27mr7853161qkn.438.1569628413990; 
	Fri, 27 Sep 2019 16:53:33 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7]) by smtp.gmail.com with ESMTPSA id
	a134sm2091196qkc.95.2019.09.27.16.53.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Sep 2019 16:53:33 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 27 Sep 2019 23:53:19 +0000
Message-Id: <20190927235319.54842-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] kubernetes: Security fix for CVE </CVE-2018-1002105>
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: muislam@microsoft.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 23:53:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../kubernetes/CVE-2018-1002105.patch         | 87 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch b/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
new file mode 100644
index 0000000..9901bb2
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
@@ -0,0 +1,87 @@
+From b2c05ca842b97090df424e0401968ba8d7ee3ecb Mon Sep 17 00:00:00 2001
+From: Jordan Liggitt <liggitt@google.com>
+Date: Mon, 5 Nov 2018 23:50:35 -0500
+Subject: [PATCH] Verify backend upgraded connection
+Reply-To: muislam@microsoft.com
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2018-1002105
+
+Upstream-Status: Backport
+---
+ .../pkg/util/proxy/upgradeaware.go            | 37 +++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+
+diff --git a/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go b/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
+index 4d5cd34d48..b14819079c 100644
+--- a/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
++++ b/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
+@@ -17,6 +17,7 @@ limitations under the License.
+ package proxy
+ 
+ import (
++	"bufio"
+ 	"bytes"
+ 	"context"
+ 	"fmt"
+@@ -269,6 +270,18 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
+ 	}
+ 	defer backendConn.Close()
+ 
++	// determine the http response code from the backend by reading from rawResponse+backendConn
++	rawResponseCode, headerBytes, err := getResponseCode(io.MultiReader(bytes.NewReader(rawResponse), backendConn))
++	if err != nil {
++		klog.V(6).Infof("Proxy connection error: %v", err)
++		h.Responder.Error(w, req, err)
++		return true
++	}
++	if len(headerBytes) > len(rawResponse) {
++		// we read beyond the bytes stored in rawResponse, update rawResponse to the full set of bytes read from the backend
++		rawResponse = headerBytes
++	}
++
+ 	// Once the connection is hijacked, the ErrorResponder will no longer work, so
+ 	// hijacking should be the last step in the upgrade.
+ 	requestHijacker, ok := w.(http.Hijacker)
+@@ -293,6 +306,17 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
+ 		}
+ 	}
+ 
++	if rawResponseCode != http.StatusSwitchingProtocols {
++		// If the backend did not upgrade the request, finish echoing the response from the backend to the client and return, closing the connection.
++		klog.V(6).Infof("Proxy upgrade error, status code %d", rawResponseCode)
++		_, err := io.Copy(requestHijackedConn, backendConn)
++		if err != nil && !strings.Contains(err.Error(), "use of closed network connection") {
++			klog.Errorf("Error proxying data from backend to client: %v", err)
++		}
++		// Indicate we handled the request
++		return true
++	}
++
+ 	// Proxy the connection. This is bidirectional, so we need a goroutine
+ 	// to copy in each direction. Once one side of the connection exits, we
+ 	// exit the function which performs cleanup and in the process closes
+@@ -354,6 +378,19 @@ func (h *UpgradeAwareHandler) DialForUpgrade(req *http.Request) (net.Conn, error
+ 	return dial(updatedReq, h.UpgradeTransport)
+ }
+ 
++// getResponseCode reads a http response from the given reader, returns the status code,
++// the bytes read from the reader, and any error encountered
++func getResponseCode(r io.Reader) (int, []byte, error) {
++	rawResponse := bytes.NewBuffer(make([]byte, 0, 256))
++	// Save the bytes read while reading the response headers into the rawResponse buffer
++	resp, err := http.ReadResponse(bufio.NewReader(io.TeeReader(r, rawResponse)), nil)
++	if err != nil {
++		return 0, nil, err
++	}
++	// return the http status code and the raw bytes consumed from the reader in the process
++	return resp.StatusCode, rawResponse.Bytes(), nil
++}
++
+ // dial dials the backend at req.URL and writes req to it.
+ func dial(req *http.Request, transport http.RoundTripper) (net.Conn, error) {
+ 	conn, err := DialURL(req.Context(), req.URL, transport)
+-- 
+2.23.0
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index a0e0e47..b587e16 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=master;name=kuberne
            file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
            file://0001-cross-don-t-build-tests-by-default.patch \
            file://0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch \
+           file://CVE-2018-1002105.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.23.0


