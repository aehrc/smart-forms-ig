# Smart Forms IG – Local Build and Questionnaire Assembly

[Smart Forms FHIR Implementation Guide - Continuous Integration Build](https://build.fhir.org/ig/aehrc/smart-forms-ig/)

---

# 🛠 To Build IG Locally

## ⚡ Without Validation (Quick for Development)

To build the IG locally run the genonce script with validation and generation turned off.  
> ⚠️ Note: Turning off generation currently does not change anything — this requires further investigation.

```bash
./_genonce.sh -validation-off -generation-off
```


## 📝 Assembling Questionnaires

The **Smart Forms server** provides an `$assemble` operation that combines multiple **sub-questionnaires** into a single assembled questionnaire.  
The `bulk-import-ci.py` script automates this process by:  

1. Sending all sub-questionnaires from the local `output/` directory to the Smart Forms server.  
2. Triggering the server’s `$assemble` function to generate the assembled questionnaire.  
3. Optionally uploading the assembled questionnaire back to the server or writing it to disk.  

> ⚠️ **Note:** Each run of the script re-sends all sub-questionnaires. They are stored on the server but not directly used for inference, so it is safe to re-upload them — even if some contain errors.

> **Note**: You will need to install "Requests" library on the Python virtual environment you are working with to run this script. `pip install requests`

---

### 🚀 Usage

The script supports the following arguments:

- `--skip`  
  Skip running `_genonce.sh` (useful if resources are already built).  
  

- `--no-cloud-form-update`  
  Do not upload the assembled questionnaire to the Smart Forms server.  
  Instead, the assembled questionnaire will only be written locally as  
  `AboriginalTorresStraitIslanderHealthCheck-Assembled.json`.

---

### 🔧 Examples

1. **Build fresh resources, assemble questionnaires and upload the assembled Questionnaire to the forms server**  
   ```bash
   python bulk-import-ci.py
   ```

2. **Skip generation of the resource and do not upload the assembled Questionnaire to the forms server**
   ```bash
   python bulk-import-ci.py --skip --no-cloud-form-update
```

