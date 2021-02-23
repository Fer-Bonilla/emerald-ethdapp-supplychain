import React, { Component } from 'react';

class Main extends Component {

  render() {
    return (
      <div id="content">
        <h2>Emerald Overview</h2>
        <div class="row">

        {/* Load data for FetchBufferOne */}
          <div class="column">
        <form onSubmit={(event) => {
          event.preventDefault()
          const upc = 1//this.upc.value
          this.props.fetchItemBufferOne(upc)
        }}>
          <div className="form-group mr-sm-2">
            Emerald UPC
            <br></br>
            <input
              id="upc"
              type="number"
              ref={(input) => { this.upc = input }}
              className="form-contro"
              placeholder="Emerald UPC"
              required/>              
          </div>
          <div className="button-div">
          <button type="submit" className="btn btn-primary">Fetch Data1</button>   
          </div>
          <div className="info">
           <h5>BufferOne data</h5>
              <b>SKU: </b>{this.props.contractData1[0]}<br></br>
              <b>UPC: </b>{this.props.contractData1[1]}<br></br>
              <b>Owner ID: </b>{this.props.contractData1[2]}<br></br>
              <b>originMinerID: </b>{this.props.contractData1[3]}<br></br>
              <b>originMineName: </b>{this.props.contractData1[4]}<br></br>
              <b>originMineInformation: </b>{this.props.contractData1[5]}<br></br> 
              <b>originMineLatitude: </b>{this.props.contractData1[6]}<br></br>
              <b>originMineLongitude: </b>{this.props.contractData1[7]}<br></br>     
            </div>
        </form>
        </div>

        
        {/* Load data for FetchBufferTwo */}
        <div class="column">
        <form onSubmit={(event) => {
          event.preventDefault()
          const upc = 1//this.upc.value
          this.props.fetchItemBufferTwo(upc)
        }}>
          <div className="form-group mr-sm-2">
            Emerald UPC
            <br></br>
            <input
              id="upc"
              type="number"
              ref={(input) => { this.upc = input }}
              className="form-contro"
              placeholder="Emerald UPC"
              required/>              
          </div>
          <div className="button-div">
          <button type="submit" className="btn btn-primary">Fetch Data2</button>
          </div>
          <div className="info">
           <h5>BufferTwo data</h5>
              <b>SKU: </b>{this.props.contractData2[0]}<br></br>
              <b>UPC: </b>{this.props.contractData2[1]}<br></br>
              <b>productID: </b>{this.props.contractData2[2]}<br></br>
              <b>price: </b>{this.props.contractData2[3]}<br></br>
              <b>emeraldState: </b>{this.props.contractData2[4]}<br></br>
              <b>laboratoryID: </b>{this.props.contractData2[5]}<br></br> 
              <b>custodianID: </b>{this.props.contractData2[6]}<br></br>
              <b>manufacturerID: </b>{this.props.contractData2[7]}<br></br>
              <b>customerID: </b>{this.props.contractData2[8]}<br></br>          
            </div>
        </form>
        </div>


        </div>                
        <div className="info">
        States map:
        <div class="row">
          <div class="column2">
            0 - Mined<br></br>  
            1 - Scaled<br></br>
            2 - PackedForLab<br></br>
            3 - ShipedToLab<br></br>
            4 - LabReceived<br></br>
          </div>
          <div class="column2">
            5 - Certified<br></br>
            6 - ShippedToStore<br></br>
            7 - StorageReceived<br></br>
            8 - Stored<br></br>
            9 - ForSale<br></br>
          </div>
          <div class="column2">
            10 - Sold<br></br>
            11 - ShipToManufacture<br></br>
            12 - ManufacturerReceived<br></br>
            13 - Manufactured<br></br>
            14 - PackedForSale<br></br>
            </div>
          <div class="column2">
            15 - Published<br></br>
            16 - Buyed<br></br>
            17 - ShippedToCustomer<br></br>            
            18 - Delivered<br></br>
          </div>
        </div>
        </div>
        
        <br></br>

        {/* Actor registration */}

        <h2>Register Actor (Authorization)</h2>        
        <div class="row">

        {/* Miner actor */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const address = "0x27D8D15CbC94527cAdf5eC14B69519aE23288B95"//this.address.value
                  this.props.addMiner(address)
                }}>
                  <div className="form-group">
                  Register Miner
                    <br></br>
                    <input
                      id="address"
                      type="text"
                      ref={(input) => { this.address = input }}
                      className="form-contro"
                      placeholder="Miner Address"
                      required
                      />           
                  </div>
                  
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Register Miner</button>
                  </div>
                </form>
              </div>

        {/* laboratory actor */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const address = "0x018C2daBef4904ECbd7118350A0c54DbeaE3549A"//this.address.value
                  this.props.addLaboratory(address)
                }}>
                  <div className="form-group mr-sm-2">
                  Register Laboratory
                    <br></br>
                    <input
                      id="address"
                      type="text"
                      ref={(input) => { this.address = input }}
                      className="form-contro"
                      placeholder="Miner Address"
                      required
                      />           
                  </div>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Register Laboratory</button>
                  </div>
                </form>
              </div>

        {/* custodian actor */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const address = "0xCe5144391B4aB80668965F2Cc4f2CC102380Ef0A"//this.address.value
                  this.props.addCustodian(address)
                }}>
                  <div className="form-group mr-sm-2">
                  Register Custodian
                    <br></br>
                    <input
                      id="address"
                      type="text"
                      ref={(input) => { this.address = input }}
                      className="form-contro"
                      placeholder="Custodian Address"
                      required
                      />           
                  </div>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Register custodian</button>
                  </div>
                </form>
              </div>

        {/* Manufacturer actor */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const address = "0x460c31107DD048e34971E57DA2F99f659Add4f02"//this.address.value
                  this.props.addManufacturer(address)
                }}>
                  <div className="form-group mr-sm-2">
                  Register Manufacturer
                    <br></br>
                    <input
                      id="address"
                      type="text"
                      ref={(input) => { this.address = input }}
                      className="form-contro"
                      placeholder="Manufacturer Address"
                      required
                      />           
                  </div>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Register manufacturer</button>
                  </div>
                </form>
              </div>

        {/* Customer actor */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const address = "0xD37b7B8C62BE2fdDe8dAa9816483AeBDBd356088" //this.address.value
                  this.props.addCustomer(address)
                }}>
                  <div className="form-group mr-sm-2">
                  Register Customer
                    <br></br>
                    <input
                      id="address"
                      type="text"
                      ref={(input) => { this.address = input }}
                      className="form-contro"
                      placeholder="Customer Address"
                      required
                      />           
                  </div>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Register Customer</button>
                  </div>
                </form>
              </div>

        </div>



        {/* Minner operations*/}
        <h2>Miner Operations</h2>        
        <div class="row">
          <div class="column">
        {/* Extract Emerald Form */}            
            <div class="form-group">
              <form onSubmit={(event) => {
                event.preventDefault()
                const sku = 1//this.sku.value
                const upc = 1//this.upc.value
                const originMinerID = this.originMinerID.value
                const originMineName = this.originMineName.value
                const originMineInformation = this.originMineInformation.value
                const originMineLatitude = this.originMineLatitude.value
                const originMineLongitude = this.originMineLongitude.value
                this.props.extractEmerald(sku, upc, originMinerID, originMineName, originMineInformation, originMineLatitude, originMineLongitude)
              }}>
                <div className="form-group mr-sm-2">
                Miner ID 
                  <br></br>
                  <input
                    id="originMinerID"
                    type="text"
                    ref={(input) => { this.originMinerID = input }}
                    className="form-contro"
                    //class="input-field"
                    placeholder="Miner ID"
                    required
                    />
                    <br></br>            
                    SKU 
                  <br></br>
                  <input
                    id="sku"
                    type="number"
                    ref={(input) => { this.sku = input }}
                    className="form-contro"
                    //class="input-field"
                    placeholder="sku"
                    required
                    size="300" />
                    <br></br>
                  UPC
                  <br></br>
                  <input
                    id="upc"
                    type="number"
                    ref={(input) => { this.upc = input }}
                    className="form-contro"
                    placeholder="upc"
                    required
                    size="300" />                    
                  Mine Name 
                  <br></br>
                  <input
                    id="originMineName"
                    type="text"
                    ref={(input) => { this.originMineName = input }}
                    className="form-contro"
                    //class="input-field"
                    placeholder="Mine name"
                    required
                    size="300" />
                    <br></br>
                  Mine Information
                  <br></br>
                  <input
                    id="originMineInformation"
                    type="text"
                    ref={(input) => { this.originMineInformation = input }}
                    className="form-contro"
                    placeholder="Mine Information"
                    required
                    size="300" />
                  <br></br>
                  Mine Latitude
                  <br></br>
                  <input
                    id="originMineLatitude"
                    type="text"
                    ref={(input) => { this.originMineLatitude = input }}
                    className="form-contro"
                    placeholder="Mine latitude"
                    required
                    size="300"/>
                  <br></br>                            
                  Mine Longitud
                  <br></br>
                  <input
                    id="originMineLongitude"
                    type="text"
                    ref={(input) => { this.originMineLongitude = input }}
                    className="form-contro"
                    placeholder="Mine longitud"
                    required
                    size="300"/>  
                </div>
                <div className="button-div">
                <button type="submit" className="btn btn-primary">Extract Emerald</button>
                </div>
              </form>
            </div>
          </div>


          <div class="column">

        {/* Scale Emerald Form */}
            <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  const scaleInfo = this.scaleInfo.value
                  this.props.scaleEmerald(upc, scaleInfo)
                }}>
                  <div className="form-group mr-sm-2">
                  Scale Info
                    <br></br>
                    <input
                      id="scaleInfo"
                      type="text"
                      ref={(input) => { this.scaleInfo = input }}
                      className="form-contro"
                      //class="input-field"
                      placeholder="Emerald scale information"
                      required
                      />
                      <br></br>            
                  </div>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Scale Emerald</button>
                  </div>
                </form>
              </div>

        {/* Pack Emerald */}
            <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  const laboratoryID = "0x018C2daBef4904ECbd7118350A0c54DbeaE3549A" //this.laboratoryID.value
                  const custodianID = "0xCe5144391B4aB80668965F2Cc4f2CC102380Ef0A"//this.custodianID.value
                  this.props.packScaledEmerald(upc,laboratoryID,custodianID)
                }}>
                Laboratory Authorized ID 
                  <br></br>
                  <input
                    id="laboratoryID"
                    type="text"
                    ref={(input) => { this.laboratoryID = input }}
                    className="form-contro"
                    //class="input-field"
                    placeholder="Authorized laboratory ID"
                    required
                    />
                Custodian authorized ID
                  <br></br>
                  <input
                    id="custodianID"
                    type="text"
                    ref={(input) => { this.custodianID = input }}
                    className="form-contro"
                    //class="input-field"
                    placeholder="Authorized custodian ID"
                    required
                    />                    
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Pack Emerald</button>
                  </div>
                </form>
              </div>

            {/* </div> */}

        {/* Ship Emerald to Laboratory */}
        <div class="form-group">
            <form onSubmit={(event) => {
              event.preventDefault()
              const upc = 1
              this.props.shipToLaboratory(upc)
            }}>

              <div className="button-div">
              <button type="submit" className="btn btn-primary">Ship Emerald to Lab</button>
              </div>
            </form>
          </div>
        {/* </div> */}

        {/* Register emerald for sale */}
        <div class="form-group">
            <form onSubmit={(event) => {
              event.preventDefault()
              const upc = 1
              const marketPrice = window.web3.utils.toWei("1", 'Ether')
              this.props.registerForSale(upc,marketPrice)
            }}>
            Price 
            <br></br>
            <input
              id="marketPrice"
              type="number"
              ref={(input) => { this.sku = input }}
              className="form-contro"
              placeholder="sku"
              required
              size="300" />
              <br></br>
              <div className="button-div">
              <button type="submit" className="btn btn-primary">Register Emerald for sale</button>
              </div>
            </form>
          </div>
        </div>
        </div>


        {/* Laboratory Operations */}

        <h2>Laboratory Operations</h2>        
        <div class="row">

        {/* Confirm the emerald reception */}            
            <div class="form-group">
              <form onSubmit={(event) => {
                event.preventDefault()
                const upc = 1
                this.props.laboratoryReceived(upc)
              }}>

                <div className="button-div">
                <button type="submit" className="btn btn-primary">Confirm Emerald reception</button>
                </div>
              </form>
            </div>


        {/* Certify Emerald */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  const certifiedProperties = "data"
                  this.props.certifyEmerald(upc, certifiedProperties)
                }}>
                  <div className="form-group mr-sm-2">
                  Certify Emerald
                    <br></br>
                    <input
                      id="scaleInfo"
                      type="text"
                      ref={(input) => { this.certifiedProperties = input }}
                      className="form-contro"
                      //class="input-field"
                      placeholder="Emerald certified information"
                      required
                      />           
                  </div>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Certify Emerald</button>
                  </div>
                </form>
              </div>

        {/* Ship certified emerald to custodian */}            
        <div class="form-group">
              <form onSubmit={(event) => {
                event.preventDefault()
                const upc = 1
                this.props.shipToSecureStore(upc)
              }}>

                <div className="button-div">
                <button type="submit" className="btn btn-primary">Ship certified emerald to storage</button>
                </div>
              </form>
            </div>

        </div>

        {/* Custodian Operations */}
        <h2>Custodian Operations</h2>        
        <div class="row">

        {/* Confirm the emerald reception */}            
            <div class="form-group">
              <form onSubmit={(event) => {
                event.preventDefault()
                const upc = 1
                this.props.SecureStorageReceived(upc)
              }}>

                <div className="button-div">
                <button type="submit" className="btn btn-primary">Confirm Emerald reception</button>
                </div>
              </form>
          </div>

        {/* Confirm Store Emeralad */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  this.props.StoreEmerald(upc)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Store Emerald</button>
                  </div>
                </form>
              </div>

        {/* Confirm Store Emeralad */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  this.props.shipToManufacturer(upc)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Ship Emerald to Manufucturer</button>
                  </div>
                </form>
              </div>


        </div>


        {/* Manufacturer Operations */}

        <h2>Manufacturer Operations</h2>        
        <div class="row">
        {/* Buy Emeralds from emeralds for sale */}            
            <div class="form-group">
              <form onSubmit={(event) => {
                event.preventDefault()
                const upc = 1
                this.props.buyFromMiner(upc)
              }}>

                <div className="button-div">
                <button type="submit" className="btn btn-primary">Buy Emerald</button>
                </div>
              </form>
          </div>

        {/* Confirm emerald reception from custodian */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  this.props.receiveFromStorage(upc)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Confirm emerald reception</button>
                  </div>
                </form>
              </div>

        {/* Manufacture Emerald */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  const manufacturedInfo = "data manufactured"
                  this.props.manufactureEmerald(upc, manufacturedInfo)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Manufacture Emerald</button>
                  </div>
                </form>
              </div>

        {/* Pack Manufactured Emerald */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  this.props.packCutEmerald(upc)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Pack Manufactured Emerald</button>
                  </div>
                </form>
              </div>

        {/* Publish Manufactured Emerald for sale*/}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  const marketPrice = window.web3.utils.toWei("1", 'Ether')
                  this.props.publishEmerald(upc, marketPrice)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Publish for sale</button>
                  </div>
                </form>
              </div>

        {/* Ship to customer*/}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  this.props.shipEmeraldToCustomer(upc)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Ship emerald to customer</button>
                  </div>
                </form>
              </div>


        </div>


        {/* Customer Operations */}

        <h2>Customer Operations</h2>        
        <div class="row">
        {/* Buy Emeralds from manufactured emeralds available */}            
            <div class="form-group">
              <form onSubmit={(event) => {
                event.preventDefault()
                const upc = 1
                this.props.buyFromManufacturer(upc)
              }}>

                <div className="button-div">
                <button type="submit" className="btn btn-primary">Buy Manufactured Emerald</button>
                </div>
              </form>
          </div>

        {/* Confirm emerald reception from custodian */}
        <div class="form-group">
                <form onSubmit={(event) => {
                  event.preventDefault()
                  const upc = 1
                  this.props.deliverToCustomer(upc)
                }}>
                  <div className="button-div">
                  <button type="submit" className="btn btn-primary">Confirm manufactured emerald reception</button>
                  </div>
                </form>
              </div>
        </div>




      </div>
    );
  }
}

export default Main;
